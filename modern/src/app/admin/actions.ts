"use server";

import { z } from "zod";
import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { requireAdmin } from "@/lib/dal";

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

