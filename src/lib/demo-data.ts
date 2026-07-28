import bcrypt from "bcryptjs";
import type { PrismaClient } from "@prisma/client";
import { isValidFoodImage } from "@/lib/food-images";

/**
 * The single source of truth for the demo dataset.
 *
 * Both `prisma/seed.ts` and the hourly reset cron (`/api/cron/reset`) call
 * `resetDemoData`, so a visitor always lands on exactly the same restaurant no
 * matter how much the previous visitor rearranged it.
 *
 * The catalogue — users, menu, tables — is fully deterministic: no
 * `Math.random()`, no clock reads, so every reset rebuilds an identical
 * restaurant. The orders and reservations further down are the deliberate
 * exception, and say why.
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

/** `sortOrder` drives the order sections appear in on the menu. */
const foodClasses = [
  { name: "Burger", sortOrder: 1 },
  { name: "Pizza", sortOrder: 2 },
  { name: "Salad", sortOrder: 3 },
  { name: "Dessert", sortOrder: 4 },
  { name: "Drink", sortOrder: 5 },
];

/**
 * One dish per photo in `public/food/`, named for what the photo actually shows,
 * so nothing on the menu is illustrated by a stand-in. Adding a dish therefore
 * means adding a photo first — see the gallery in src/lib/food-images.ts.
 *
 * Where a photo matched a dish from the original 2016 menu, the original name is
 * kept (Margherita, Quattro stagioni, Capricciosa, Hot Dog, Chicken Burger,
 * Double Cheeseburger, BauernToast, Tomato Salad, Brownies, Red Wine).
 */
const items = [
  // Pizza
  { name: "Margherita", foodClass: "Pizza", price: 6.0, available: true, image: "/food/pizza-margherita.jpg" },
  { name: "Diavola", foodClass: "Pizza", price: 8.0, available: true, image: "/food/pizza-pepperoni.jpg" },
  { name: "Quattro stagioni", foodClass: "Pizza", price: 8.0, available: true, image: "/food/pizza-quattro-stagioni.jpg" },
  { name: "Capricciosa", foodClass: "Pizza", price: 7.5, available: true, image: "/food/pizza-ham-mushroom.jpg" },
  { name: "Quattro formaggi", foodClass: "Pizza", price: 8.5, available: true, image: "/food/pizza-quattro-formaggi.jpg" },
  { name: "Vegetariana", foodClass: "Pizza", price: 7.5, available: true, image: "/food/pizza-vegetariana.jpg" },

  // Burger
  { name: "Chicken Burger", foodClass: "Burger", price: 13.0, available: true, image: "/food/chicken-burger.jpg" },
  { name: "Double Cheeseburger", foodClass: "Burger", price: 15.5, available: true, image: "/food/double-cheese-burger.jpg" },
  { name: "Pastrami Burger", foodClass: "Burger", price: 13.5, available: true, image: "/food/pastrami-burger.jpg" },
  { name: "Veggie Burger", foodClass: "Burger", price: 12.5, available: true, image: "/food/veggie-burger.jpg" },
  { name: "Hot Dog", foodClass: "Burger", price: 6.0, available: true, image: "/food/hotdog.jpg" },
  { name: "Ham & Cheese Toast", foodClass: "Burger", price: 5.5, available: true, image: "/food/ham-cheese-toast.jpg" },

  // Salad
  { name: "Mixed Salad", foodClass: "Salad", price: 7.5, available: true, image: "/food/salad-mixed.jpg" },
  { name: "Tomato & Cucumber Salad", foodClass: "Salad", price: 6.0, available: true, image: "/food/salad-tomato-cucumber.jpg" },
  { name: "Tomato Salad", foodClass: "Salad", price: 7.0, available: false, image: "/food/salad-tomato-dish.jpg" },

  // Dessert
  { name: "Brownies", foodClass: "Dessert", price: 4.5, available: true, image: "/food/brownies.jpg" },
  { name: "Chocolate Fudge Brownie", foodClass: "Dessert", price: 5.0, available: true, image: "/food/brownie-chocolate.jpg" },
  { name: "Lemon Cheesecake", foodClass: "Dessert", price: 5.5, available: true, image: "/food/cheesecake-lemon.jpg" },
  { name: "Pear & Chocolate Cake", foodClass: "Dessert", price: 6.0, available: true, image: "/food/pear-chocolate-cake.jpg" },

  // Drink
  { name: "Red Wine", foodClass: "Drink", price: 4.4, available: false, image: "/food/red-wine.jpg" },
  { name: "Bubble Tea", foodClass: "Drink", price: 3.8, available: true, image: "/food/boba-tea.jpg" },
  { name: "Fresh Fruit Juice", foodClass: "Drink", price: 3.5, available: true, image: "/food/fruit-juice.jpg" },
  { name: "Sparkling Water", foodClass: "Drink", price: 1.5, available: true, image: "/food/sparkling-water.jpg" },
  { name: "Beer", foodClass: "Drink", price: 4.0, available: true, image: "/food/beer.jpg" },
  { name: "Espresso", foodClass: "Drink", price: 1.8, available: true, image: "/food/espresso.jpg" },
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
 * Sample take-away orders, so the admin dashboard opens with real revenue and a
 * populated "recent orders" list rather than zeros. Between them they cover
 * every status in the lifecycle.
 *
 * `hoursAgo` is an offset from the reset time, not a fixed date: the dashboard
 * sorts by recency and the reservations below are filtered on `startDate >= now`,
 * so hardcoded timestamps would drift into the past and the lists would empty
 * out. This is the one place the dataset reads the clock — the *shape* stays
 * identical on every reset, only the anchor moves.
 *
 * Costs are computed from the seeded item prices rather than written by hand,
 * so they can never disagree with the menu.
 */
const demoOrders = [
  {
    customerName: "Elena Bianchi",
    phoneNumber: "+39 331 448 2210",
    address: "Via Museo 12, 39100 Bolzano",
    status: "DELIVERED" as const,
    hoursAgo: 52,
    comment: "Ring the top bell, please.",
    lines: [
      ["Margherita", 2],
      ["Sparkling Water", 2],
    ] as const,
  },
  {
    customerName: "Marco Ferrari",
    phoneNumber: "+39 340 992 1187",
    address: "Piazza Erbe 4, 39100 Bolzano",
    status: "DELIVERED" as const,
    hoursAgo: 27,
    comment: null,
    lines: [
      ["Quattro stagioni", 1],
      ["Mixed Salad", 1],
      ["Red Wine", 2],
    ] as const,
  },
  {
    customerName: "Sofia Conti",
    phoneNumber: "+39 328 771 5540",
    address: "Via Cassa di Risparmio 7, 39100 Bolzano",
    status: "CANCELED" as const,
    hoursAgo: 22,
    comment: "Customer called to cancel.",
    lines: [["Double Cheeseburger", 1]] as const,
  },
  {
    // Attached to the demo customer account, so signing in as them shows history.
    customerName: "Chiara Rossi",
    phoneNumber: "+39 320 111 2233",
    address: "Via Roma 14, 39100 Bolzano",
    status: "READY" as const,
    hoursAgo: 4,
    comment: "No onions on the salad.",
    userId: DEMO_CUSTOMER_ID,
    lines: [
      ["Quattro stagioni", 1],
      ["Tomato Salad", 1],
      ["Bubble Tea", 2],
    ] as const,
  },
  {
    customerName: "Luca Moretti",
    phoneNumber: "+39 347 220 9014",
    address: "Via Talvera 22, 39100 Bolzano",
    status: "PREPARING" as const,
    hoursAgo: 2,
    comment: null,
    lines: [
      ["Chicken Burger", 2],
      ["Fresh Fruit Juice", 2],
    ] as const,
  },
  {
    customerName: "Giulia Ferrero",
    phoneNumber: "+39 351 604 3322",
    address: "Via Dr. Streiter 30, 39100 Bolzano",
    status: "RECEIVED" as const,
    hoursAgo: 1,
    comment: "Leave at the door.",
    lines: [
      ["Diavola", 1],
      ["Brownies", 2],
    ] as const,
  },
];

/**
 * Sample bookings. Most sit in the future so the dashboard's "upcoming
 * reservations" panel has something to show; one is in the past so the full
 * reservations table isn't uniformly forward-looking.
 *
 * Table seats come from `seatSizes` above — each `table` here is chosen to
 * actually fit its party, matching the rule the booking form enforces.
 */
const demoReservations = [
  {
    customerName: "Anna Gruber",
    table: "Table 6", // 6 seats
    partySize: 5,
    hoursFromNow: -20,
    durationMinutes: 90,
    comment: "Birthday — brought their own cake.",
  },
  {
    customerName: "Chiara Rossi",
    table: "Table 3", // 4 seats
    partySize: 4,
    hoursFromNow: 6,
    durationMinutes: 90,
    comment: null,
    userId: DEMO_CUSTOMER_ID,
  },
  {
    customerName: "Thomas Mair",
    table: "Table 1", // 2 seats
    partySize: 2,
    hoursFromNow: 27,
    durationMinutes: 60,
    comment: "Window seat if possible.",
  },
  {
    customerName: "Familie Hofer",
    table: "Table 9", // 10 seats
    partySize: 8,
    hoursFromNow: 51,
    durationMinutes: 120,
    comment: "Two high chairs needed.",
  },
  {
    customerName: "Davide Russo",
    table: "Table 8", // 8 seats
    partySize: 6,
    hoursFromNow: 74,
    durationMinutes: 120,
    comment: null,
  },
];

const HOUR_MS = 60 * 60 * 1000;

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

  /**
   * The catalogue is created with explicit, position-derived ids rather than
   * letting Postgres allocate them.
   *
   * The cart lives in the visitor's localStorage and stores item ids; the table
   * picker posts a table id. If a reset reallocated those ids, every cart and
   * every open booking form left over from before the reset would point at rows
   * that no longer exist — which is exactly how "Unknown item in cart" used to
   * reach the checkout as a 500. Pinning them keeps a cart usable across resets.
   */
  for (const [index, foodClass] of foodClasses.entries()) {
    await prisma.foodClass.create({ data: { id: index + 1, ...foodClass } });
  }

  const foodClassByName = new Map(
    (await prisma.foodClass.findMany()).map((fc) => [fc.name, fc])
  );

  for (const [index, item] of items.entries()) {
    const foodClass = foodClassByName.get(item.foodClass);
    if (!foodClass) throw new Error(`Missing food class: ${item.foodClass}`);
    if (!isValidFoodImage(item.image)) {
      throw new Error(
        `Seeded item "${item.name}" points at ${item.image}, which is not in the ` +
          `gallery in src/lib/food-images.ts`
      );
    }
    await prisma.item.create({
      data: {
        id: index + 1,
        name: item.name,
        price: item.price,
        available: item.available,
        image: item.image,
        foodClassId: foodClass.id,
      },
    });
  }

  await prisma.roomTable.createMany({
    data: roomTables.map((table, index) => ({ id: index + 1, ...table })),
  });

  // Explicit ids leave each sequence behind the rows just written, so the next
  // insert would collide. Realign all three.
  for (const [table, count] of [
    ["FoodClass", foodClasses.length],
    ["Item", items.length],
    ["RoomTable", roomTables.length],
  ] as const) {
    await prisma.$executeRawUnsafe(
      `SELECT setval(pg_get_serial_sequence('"${table}"', 'id'), $1, true)`,
      count
    );
  }

  const itemByName = new Map(
    (await prisma.item.findMany({ select: { id: true, name: true, price: true } })).map(
      (i) => [i.name, i]
    )
  );
  const tableByName = new Map(
    (await prisma.roomTable.findMany({ select: { id: true, name: true, seats: true } })).map(
      (t) => [t.name, t]
    )
  );

  const now = Date.now();

  for (const order of demoOrders) {
    const lines = order.lines.map(([name, quantity]) => {
      const item = itemByName.get(name);
      if (!item) throw new Error(`Demo order references unknown item: ${name}`);
      return { item, quantity };
    });

    const cost = lines.reduce(
      (sum, line) => sum + line.item.price * line.quantity,
      0
    );
    const orderDate = new Date(now - order.hoursAgo * HOUR_MS);

    await prisma.takeawayOrder.create({
      data: {
        customerName: order.customerName,
        phoneNumber: order.phoneNumber,
        address: order.address,
        comment: order.comment,
        status: order.status,
        userId: "userId" in order ? order.userId : null,
        // Rounded to the cent: floating-point item prices otherwise accumulate
        // into values like 19.900000000000002 in the revenue total.
        cost: Math.round(cost * 100) / 100,
        orderDate,
        createdAt: orderDate,
        items: {
          create: lines.map((line) => ({
            quantity: line.quantity,
            item: { connect: { id: line.item.id } },
          })),
        },
      },
    });
  }

  for (const reservation of demoReservations) {
    const table = tableByName.get(reservation.table);
    if (!table) {
      throw new Error(`Demo reservation references unknown table: ${reservation.table}`);
    }
    if (table.seats < reservation.partySize) {
      throw new Error(
        `Demo reservation for ${reservation.customerName} seats ${reservation.partySize} ` +
          `at ${table.name}, which only has ${table.seats}`
      );
    }

    const startDate = new Date(now + reservation.hoursFromNow * HOUR_MS);

    await prisma.reservation.create({
      data: {
        customerName: reservation.customerName,
        partySize: reservation.partySize,
        roomTableId: table.id,
        userId: "userId" in reservation ? reservation.userId : null,
        comment: reservation.comment,
        startDate,
        endDate: new Date(
          startDate.getTime() + reservation.durationMinutes * 60 * 1000
        ),
      },
    });
  }

  return {
    users: DEMO_ACCOUNTS.length,
    foodClasses: foodClasses.length,
    items: items.length,
    roomTables: roomTables.length,
    orders: demoOrders.length,
    reservations: demoReservations.length,
  };
}
