import { PrismaClient } from "@prisma/client";
import { PrismaNeon } from "@prisma/adapter-neon";
import { resetDemoData } from "../src/lib/demo-data";

const databaseUrl = process.env.DIRECT_DATABASE_URL ?? process.env.DATABASE_URL;
if (!databaseUrl) {
  throw new Error("Missing env var: set DIRECT_DATABASE_URL or DATABASE_URL");
}

const prisma = new PrismaClient({
  adapter: new PrismaNeon({ connectionString: databaseUrl }),
});

async function main() {
  console.log("Seeding database...");
  const counts = await resetDemoData(prisma);
  console.log(
    `Seed complete: ${counts.users} users, ${counts.foodClasses} food classes, ` +
      `${counts.items} items, ${counts.roomTables} tables.`
  );
}

main()
  .catch((err) => {
    console.error(err);
    process.exitCode = 1;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
