"use server";

import { z } from "zod";
import { prisma } from "@/lib/prisma";
import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/dal";

/**
 * These actions return errors rather than throwing them.
 *
 * An uncaught throw in a server action is a 500 with an opaque digest — fine for
 * a bug, wrong for outcomes the user can actually cause. "That table is already
 * booked" and "your cart refers to dishes that no longer exist" are ordinary
 * results of using the app, and both used to crash the page.
 */
export type FormState = { error?: string } | undefined;

/**
 * The order action reports the new id back instead of redirecting itself: the
 * caller has to empty the cart on success, and that has to happen before the
 * navigation. `redirect()` throws, so nothing after it would ever run.
 */
export type PlaceOrderResult = { error: string } | { orderId: number };

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

export async function placeTakeawayOrder(
  formData: FormData
): Promise<PlaceOrderResult> {
  const parsed = placeOrderSchema.safeParse({
    customerName: formData.get("customerName"),
    phoneNumber: formData.get("phoneNumber"),
    address: formData.get("address"),
    comment: formData.get("comment"),
    cartJson: formData.get("cartJson"),
  });
  if (!parsed.success) {
    return { error: "Check the delivery details and try again." };
  }

  const cart = cartSchema.safeParse(JSON.parse(parsed.data.cartJson));
  if (!cart.success) return { error: "Your cart could not be read." };
  if (cart.data.length === 0) return { error: "Your cart is empty." };

  const items = await prisma.item.findMany({
    where: { id: { in: cart.data.map((c) => c.itemId) } },
    select: { id: true, price: true, available: true, name: true },
  });
  const itemById = new Map(items.map((i) => [i.id, i]));

  // The cart lives in localStorage but the demo database is wiped and re-seeded
  // on a schedule, so a cart left open across a reset points at ids that are
  // gone. That is the common case here, not a corrupted request.
  const missing = cart.data.filter((line) => !itemById.has(line.itemId));
  if (missing.length > 0) {
    return {
      error:
        "Some items in your cart are no longer on the menu — this demo resets its " +
        "data every hour. Clear the cart and add them again.",
    };
  }

  const unavailable = cart.data
    .map((line) => itemById.get(line.itemId)!)
    .filter((item) => !item.available);
  if (unavailable.length > 0) {
    return {
      error: `No longer available: ${unavailable
        .map((i) => i.name)
        .join(", ")}. Remove ${unavailable.length === 1 ? "it" : "them"} to continue.`,
    };
  }

  const cost = cart.data.reduce(
    (sum, line) => sum + itemById.get(line.itemId)!.price * line.quantity,
    0
  );

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
      cost: Math.round(cost * 100) / 100,
      items: {
        create: cart.data.map((line) => ({
          quantity: line.quantity,
          item: { connect: { id: line.itemId } },
        })),
      },
    },
    select: { id: true },
  });

  return { orderId: order.id };
}

const reservationSchema = z.object({
  customerName: z.string().trim().min(2).max(80),
  partySize: z.coerce.number().int().min(1).max(12),
  roomTableId: z.coerce.number().int().positive(),
  startDate: z.string().min(10),
  durationMinutes: z.coerce.number().int().min(30).max(240),
  comment: z.string().trim().max(500).optional().or(z.literal("")),
});

export async function createReservation(
  _state: FormState,
  formData: FormData
): Promise<FormState> {
  const parsed = reservationSchema.safeParse({
    customerName: formData.get("customerName"),
    partySize: formData.get("partySize"),
    roomTableId: formData.get("roomTableId"),
    startDate: formData.get("startDate"),
    durationMinutes: formData.get("durationMinutes"),
    comment: formData.get("comment"),
  });
  if (!parsed.success) {
    return { error: "Check the booking details and try again." };
  }

  const start = new Date(parsed.data.startDate);
  if (Number.isNaN(start.getTime())) {
    return { error: "That start time could not be read." };
  }
  const end = new Date(start.getTime() + parsed.data.durationMinutes * 60_000);

  const table = await prisma.roomTable.findUnique({
    where: { id: parsed.data.roomTableId },
    select: { id: true, seats: true, name: true },
  });
  if (!table) {
    return {
      error:
        "That table no longer exists — this demo resets its data every hour. " +
        "Reload the page and pick a table again.",
    };
  }
  if (table.seats < parsed.data.partySize) {
    return {
      error: `${table.name} seats ${table.seats}, which is too few for a party of ${parsed.data.partySize}.`,
    };
  }

  const overlapping = await prisma.reservation.count({
    where: {
      roomTableId: table.id,
      startDate: { lt: end },
      endDate: { gt: start },
    },
  });
  if (overlapping > 0) {
    return {
      error: `${table.name} is already booked for that slot. Pick another time or table.`,
    };
  }

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
