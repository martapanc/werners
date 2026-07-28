import bcrypt from "bcryptjs";
import type { PrismaClient } from "@prisma/client";

/**
 * The single source of truth for the demo dataset.
 *
 * Both `prisma/seed.ts` and the hourly reset cron (`/api/cron/reset`) call
 * `resetDemoData`, so a visitor always lands on exactly the same restaurant no
 * matter how much the previous visitor rearranged it.
 *
 * Everything here must be deterministic — no `Math.random()`, no `new Date()`
 * for stored values — otherwise the "reset" would quietly drift over time.
 */

/** Fixed IDs: session JWTs reference a user id, and the hourly reset deletes and
 * recreates every row. Pinning these keeps existing sessions valid across a reset. */
export const DEMO_CUSTOMER_ID = 1;
export const DEMO_ADMIN_ID = 2;

export const DEMO_ACCOUNTS = [
  {
    id: DEMO_CUSTOMER_ID,
    email: "customer@werners.demo",
    password: "demo1234",
    fullName: "Chiara Rossi",
    role: "CUSTOMER" as const,
    phoneNumber: "+39 320 111 2233",
    billingAddress: "Via Roma 14, 39100 Bolzano",
    points: 120,
    vipStatus: false,
  },
  {
    id: DEMO_ADMIN_ID,
    email: "admin@werners.demo",
    password: "admin1234",
    fullName: "Werner S.",
    role: "ADMIN" as const,
    phoneNumber: "+39 320 999 8877",
    billingAddress: "Piazza Walther 1, 39100 Bolzano",
    points: 0,
    vipStatus: true,
  },
];

const foodClasses = [
  { name: "Pizza", image: "/legacy/icons/pizza-2.svg" },
  { name: "Burger", image: "/legacy/icons/burger.svg" },
  { name: "Chinese", image: "/legacy/icons/noodles.svg" },
  { name: "Salad", image: "/legacy/icons/salad.svg" },
  { name: "Dessert", image: "/legacy/icons/cake.svg" },
  { name: "Drink", image: "/legacy/icons/tea-1.svg" },
];

const items = [
  // Pizza
  { name: "Margherita", foodClass: "Pizza", price: 5.5, available: true },
  { name: "Marescialla", foodClass: "Pizza", price: 5.5, available: true },
  { name: "Quattro stagioni", foodClass: "Pizza", price: 7, available: true },
  { name: "Tonno Cipolla", foodClass: "Pizza", price: 6, available: false },
  { name: "San Daniele", foodClass: "Pizza", price: 9, available: true },
  { name: "Primavera", foodClass: "Pizza", price: 6.7, available: false },
  { name: "Capricciosa", foodClass: "Pizza", price: 7.5, available: true },

  // Burger
  { name: "Hot Dog", foodClass: "Burger", price: 3.5, available: true },
  { name: "Chicken Burger", foodClass: "Burger", price: 3.7, available: true },
  { name: "Double Cheeseburger", foodClass: "Burger", price: 5.5, available: false },
  { name: "McChicken", foodClass: "Burger", price: 4.8, available: true },
  { name: "Burger Royal", foodClass: "Burger", price: 5.5, available: true },
  { name: "Hawaiian Toast", foodClass: "Burger", price: 5.0, available: false },
  { name: "BauernToast", foodClass: "Burger", price: 4.3, available: true },

  // Chinese
  { name: "Chinese noodles", foodClass: "Chinese", price: 5.5, available: true },
  { name: "Zhajiangmian", foodClass: "Chinese", price: 6.7, available: false },
  { name: "Fried Rice", foodClass: "Chinese", price: 3.5, available: false },
  { name: "Kung Pao chicken", foodClass: "Chinese", price: 7.8, available: false },
  { name: "Wonton", foodClass: "Chinese", price: 6, available: true },
  { name: "Zongzi", foodClass: "Chinese", price: 6.7, available: false },
  { name: "Peking Duck", foodClass: "Chinese", price: 8, available: true },

  // Salad
  { name: "Cesar Salad", foodClass: "Salad", price: 4.5, available: true },
  { name: "Chicken Salad", foodClass: "Salad", price: 6.7, available: true },
  { name: "Russian Salad", foodClass: "Salad", price: 5.5, available: false },
  { name: "Tomato Salad", foodClass: "Salad", price: 6.8, available: false },
  { name: "Potatoe Salad", foodClass: "Salad", price: 4.4, available: true },
  { name: "Fresh Salad", foodClass: "Salad", price: 6.7, available: true },
  { name: "Rice Salad", foodClass: "Salad", price: 4.2, available: false },

  // Dessert
  { name: "Brownies", foodClass: "Dessert", price: 4.5, available: true },
  { name: "Ice Cream", foodClass: "Dessert", price: 6.7, available: true },
  { name: "Surprise", foodClass: "Dessert", price: 12, available: false },
  { name: "Mousse", foodClass: "Dessert", price: 6.8, available: false },
  { name: "Sacher", foodClass: "Dessert", price: 4.4, available: true },
  { name: "Marshmallows", foodClass: "Dessert", price: 6.7, available: true },
  { name: "Affogato", foodClass: "Dessert", price: 4.2, available: false },

  // Drink
  { name: "Green Tea", foodClass: "Drink", price: 1.5, available: true },
  { name: "Lemon Soda", foodClass: "Drink", price: 2.7, available: true },
  { name: "Fizzy Water", foodClass: "Drink", price: 1.5, available: false },
  { name: "Beer", foodClass: "Drink", price: 2.8, available: false },
  { name: "Red Wine", foodClass: "Drink", price: 4.4, available: true },
  { name: "White Wine", foodClass: "Drink", price: 3.7, available: true },
  { name: "Sprite", foodClass: "Drink", price: 1.2, available: true },
];

/**
 * 30 tables spread over 3 rooms. The original seeded these randomly; here the
 * layout is derived from the index so every reset rebuilds the same dining room.
 */
const seatSizes = [2, 2, 4, 4, 4, 6, 6, 8, 10, 12];
const categories = ["lowcost", "medium", "highend"] as const;

const roomTables = Array.from({ length: 30 }, (_, i) => ({
  name: `Table ${i + 1}`,
  room: `Room ${(i % 3) + 1}`,
  seats: seatSizes[i % seatSizes.length],
  category: categories[i % categories.length],
}));

/**
 * Wipes every table and rewrites the pristine demo dataset.
 *
 * Deletion order matters: children before parents, since the FKs are Restrict
 * (OrderItem → Item, Reservation → RoomTable) rather than Cascade.
 */
export async function resetDemoData(prisma: PrismaClient) {
  await prisma.orderItem.deleteMany();
  await prisma.takeawayOrder.deleteMany();
  await prisma.reservation.deleteMany();
  await prisma.item.deleteMany();
  await prisma.foodClass.deleteMany();
  await prisma.roomTable.deleteMany();
  await prisma.user.deleteMany();

  for (const account of DEMO_ACCOUNTS) {
    const { password, ...rest } = account;
    await prisma.user.create({
      data: { ...rest, passwordHash: await bcrypt.hash(password, 10) },
    });
  }

  // deleteMany leaves the identity sequences where they were, so the next
  // auto-generated id would collide with the explicit ids above.
  await prisma.$executeRawUnsafe(
    `SELECT setval(pg_get_serial_sequence('"User"', 'id'), $1, true)`,
    Math.max(...DEMO_ACCOUNTS.map((a) => a.id))
  );

  for (const foodClass of foodClasses) {
    await prisma.foodClass.create({ data: foodClass });
  }

  const foodClassByName = new Map(
    (await prisma.foodClass.findMany()).map((fc) => [fc.name, fc])
  );

  for (const item of items) {
    const foodClass = foodClassByName.get(item.foodClass);
    if (!foodClass) throw new Error(`Missing food class: ${item.foodClass}`);
    await prisma.item.create({
      data: {
        name: item.name,
        price: item.price,
        available: item.available,
        foodClassId: foodClass.id,
      },
    });
  }

  await prisma.roomTable.createMany({ data: roomTables });

  return {
    users: DEMO_ACCOUNTS.length,
    foodClasses: foodClasses.length,
    items: items.length,
    roomTables: roomTables.length,
  };
}
