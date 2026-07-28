import { revalidatePath } from "next/cache";
import { prisma } from "@/lib/prisma";
import { resetDemoData } from "@/lib/demo-data";

/**
 * Hourly demo reset (scheduled in vercel.json).
 *
 * Wipes whatever visitors did and rewrites the pristine dataset, so the demo
 * greets everyone with the same restaurant. Vercel Cron sends
 * `Authorization: Bearer $CRON_SECRET`; without a matching secret this is a
 * public endpoint that would let anyone nuke the database on demand.
 */

export const dynamic = "force-dynamic";
export const maxDuration = 60;

function isAuthorized(request: Request) {
  const expected = process.env.CRON_SECRET;
  if (!expected) return false;
  return request.headers.get("authorization") === `Bearer ${expected}`;
}

async function handle(request: Request) {
  if (!isAuthorized(request)) {
    return Response.json({ error: "Unauthorized" }, { status: 401 });
  }

  const startedAt = Date.now();
  const counts = await resetDemoData(prisma);

  // The reset changes every public page; drop the cached renders so visitors
  // don't keep seeing the previous visitor's edits.
  revalidatePath("/", "layout");

  return Response.json({
    ok: true,
    durationMs: Date.now() - startedAt,
    ...counts,
  });
}

export async function GET(request: Request) {
  return handle(request);
}

export async function POST(request: Request) {
  return handle(request);
}
