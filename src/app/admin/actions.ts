"use server";

import { z } from "zod";
import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { requireAdmin } from "@/lib/dal";
import { isValidFoodImage } from "@/lib/food-images";

// Server actions are individually addressable POST endpoints — the admin
// layout's check does not cover them. Each one re-authorizes on its own.

const orderStatusSchema = z.enum([
  "RECEIVED",
  "PREPARING",
  "READY",
  "DELIVERED",
  "CANCELED",
]);

export async function updateOrderStatus(formData: FormData) {
  await requireAdmin();

  const parsed = z
    .object({
      orderId: z.coerce.number().int().positive(),
      status: orderStatusSchema,
    })
    .safeParse({
      orderId: formData.get("orderId"),
      status: formData.get("status"),
    });
  if (!parsed.success) throw new Error("Invalid order update");

  await prisma.takeawayOrder.update({
    where: { id: parsed.data.orderId },
    data: { status: parsed.data.status },
  });

  revalidatePath("/admin/orders");
  revalidatePath("/admin");
}

export async function toggleItemAvailability(formData: FormData) {
  await requireAdmin();

  const parsed = z
    .object({
      itemId: z.coerce.number().int().positive(),
    })
    .safeParse({ itemId: formData.get("itemId") });
  if (!parsed.success) throw new Error("Invalid item update");

  const existing = await prisma.item.findUnique({
    where: { id: parsed.data.itemId },
    select: { available: true },
  });
  if (!existing) throw new Error("Item not found");

  await prisma.item.update({
    where: { id: parsed.data.itemId },
    data: { available: !existing.available },
  });

  revalidatePath("/admin/menu");
  revalidatePath("/menu");
}

export async function updateItemPrice(formData: FormData) {
  await requireAdmin();

  const parsed = z
    .object({
      itemId: z.coerce.number().int().positive(),
      price: z.coerce.number().min(0).max(999),
    })
    .safeParse({ itemId: formData.get("itemId"), price: formData.get("price") });
  if (!parsed.success) throw new Error("Invalid price update");

  await prisma.item.update({
    where: { id: parsed.data.itemId },
    data: { price: parsed.data.price },
  });

  revalidatePath("/admin/menu");
  revalidatePath("/menu");
}

export async function setItemImage(formData: FormData) {
  await requireAdmin();

  const parsed = z
    .object({
      itemId: z.coerce.number().int().positive(),
      // "" clears the image; anything else must be a gallery path.
      image: z.string().max(200),
    })
    .safeParse({
      itemId: formData.get("itemId"),
      image: formData.get("image"),
    });
  if (!parsed.success) throw new Error("Invalid image update");

  // The gallery is the allow-list. Without this check a crafted POST could set
  // Item.image to any string — an off-site URL, or a path traversal — and the
  // menu would render it for every visitor.
  const { image } = parsed.data;
  if (image !== "" && !isValidFoodImage(image)) {
    throw new Error("Image is not part of the bundled gallery");
  }

  await prisma.item.update({
    where: { id: parsed.data.itemId },
    data: { image: image === "" ? null : image },
  });

  revalidatePath("/admin/menu");
  revalidatePath("/menu");
}

export async function deleteReservation(formData: FormData) {
  await requireAdmin();

  const parsed = z
    .object({
      reservationId: z.coerce.number().int().positive(),
    })
    .safeParse({ reservationId: formData.get("reservationId") });
  if (!parsed.success) throw new Error("Invalid reservation delete");

  await prisma.reservation.delete({
    where: { id: parsed.data.reservationId },
  });

  revalidatePath("/admin/reservations");
  revalidatePath("/admin");
}

