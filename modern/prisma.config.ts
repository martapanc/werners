import { defineConfig } from "prisma/config";

// Migrations need a direct connection: Neon's pooled endpoint runs PgBouncer in
// transaction mode, which can't do the session-level work migrate relies on.
// Only the CLI reads this file — the runtime client is built in src/lib/prisma.ts.
//
// Left undefined when neither var is set, so commands that don't touch a
// database (`prisma generate`, `prisma validate`, `migrate diff --from-empty`)
// still work; the ones that do connect will report the missing URL themselves.
const migrationUrl = process.env.DIRECT_DATABASE_URL ?? process.env.DATABASE_URL;

export default defineConfig({
  schema: "prisma/schema.prisma",
  ...(migrationUrl ? { datasource: { url: migrationUrl } } : {}),
  migrations: {
    seed: "tsx prisma/seed.ts",
  },
});
