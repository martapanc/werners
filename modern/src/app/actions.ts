"use server";

import { z } from "zod";
import { prisma } from "@/lib/prisma";
import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/dal";

const cartSchema = z.array(
  z.object({
    itemId: z.number().int().positive(),
    quantity: z.number().int().min(1).max(99),
  })
);

const placeOrderSchema = z.object({
  customerName: z.string().trim().min(2).max(80),
  phoneNumber: z.string().trim().min(4).max(30),
  address: z.string().trim().min(5).max(200),
  comment: z.string().trim().max(500).optional().or(z.literal("")),
  cartJson: z.string().min(2),
});

export async function placeTakeawayOrder(formData: FormData) {
  const parsed = placeOrderSchema.safeParse({
    customerName: formData.get("customerName"),
    phoneNumber: formData.get("phoneNumber"),
    address: formData.get("address"),
    comment: formData.get("comment"),
    cartJson: formData.get("cartJson"),
  });
  if (!parsed.success) {
    throw new Error("Invalid order data");
  }

  const cartRaw = JSON.parse(parsed.data.cartJson);
  const cart = cartSchema.parse(cartRaw);
  if (cart.length === 0) throw new Error("Cart is empty");

  const items = await prisma.item.findMany({
    where: { id: { in: cart.map((c) => c.itemId) } },
    select: { id: true, price: true, available: true, name: true },
  });

  const itemById = new Map(items.map((i) => [i.id, i]));
  for (const line of cart) {
    const item = itemById.get(line.itemId);
    if (!item) throw new Error("Unknown item in cart");
    if (!item.available) throw new Error(`Item not available: ${item.name}`);
  }

  const cost = cart.reduce((sum, line) => {
    const item = itemById.get(line.itemId);
    if (!item) return sum;
    return sum + item.price * line.quantity;
  }, 0);

  // Ordering stays open to guests, exactly as in the original app; signing in
  // just attaches the order to the account.
  const user = await getCurrentUser();

  const order = await prisma.takeawayOrder.create({
    data: {
      customerName: parsed.data.customerName,
      phoneNumber: parsed.data.phoneNumber,
      address: parsed.data.address,
      comment: parsed.data.comment || null,
      userId: user?.id ?? null,
      cost,
      items: {
        create: cart.map((line) => ({
          quantity: line.quantity,
          item: { connect: { id: line.itemId } },
        })),
      },
    },
    select: { id: true },
  });

  redirect(`/orders/${order.id}`);
}

const reservationSchema = z.object({
  customerName: z.string().trim().min(2).max(80),
  partySize: z.coerce.number().int().min(1).max(12),
  roomTableId: z.coerce.number().int().positive(),
  startDate: z.string().min(10),
  durationMinutes: z.coerce.number().int().min(30).max(240),
  comment: z.string().trim().max(500).optional().or(z.literal("")),
});

export async function createReservation(formData: FormData) {
  const parsed = reservationSchema.safeParse({
    customerName: formData.get("customerName"),
    partySize: formData.get("partySize"),
    roomTableId: formData.get("roomTableId"),
    startDate: formData.get("startDate"),
    durationMinutes: formData.get("durationMinutes"),
    comment: formData.get("comment"),
  });
  if (!parsed.success) throw new Error("Invalid reservation data");

  const start = new Date(parsed.data.startDate);
  if (Number.isNaN(start.getTime())) throw new Error("Invalid start date");
  const end = new Date(start.getTime() + parsed.data.durationMinutes * 60_000);

  const table = await prisma.roomTable.findUnique({
    where: { id: parsed.data.roomTableId },
    select: { id: true, seats: true, name: true },
  });
  if (!table) throw new Error("Unknown table");
  if (table.seats < parsed.data.partySize) {
    throw new Error("Selected table is too small");
  }

  const overlapping = await prisma.reservation.count({
    where: {
      roomTableId: table.id,
      startDate: { lt: end },
      endDate: { gt: start },
    },
  });
  if (overlapping > 0) throw new Error("That table is already booked");

  const user = await getCurrentUser();

  const reservation = await prisma.reservation.create({
    data: {
      customerName: parsed.data.customerName,
      partySize: parsed.data.partySize,
      roomTableId: table.id,
      userId: user?.id ?? null,
      startDate: start,
      endDate: end,
      comment: parsed.data.comment || null,
    },
    select: { id: true },
  });

  redirect(`/reservations/${reservation.id}`);
}

