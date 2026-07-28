import { prisma } from "@/lib/prisma";
import { createReservation } from "@/app/actions";
import { PublicContentHeader } from "@/components/public/content-header";

export default async function ReservationsPage() {
  const tables = await prisma.roomTable.findMany({
    orderBy: [{ seats: "asc" }, { name: "asc" }],
  });

  const now = new Date();
  const defaultStart = new Date(now.getTime() + 60 * 60_000);
  const defaultStartValue = new Date(
    defaultStart.getTime() - defaultStart.getTimezoneOffset() * 60_000
  )
    .toISOString()
    .slice(0, 16);

  return (
    <div className="mx-auto w-full max-w-5xl px-6 py-12">
      <PublicContentHeader title="Online Reservation" crumb="Table Reservation" />
      <p className="-mt-4 text-sm text-zinc-600">
        Pick a date/time and a table.
      </p>

      <div className="mt-8 grid gap-6 lg:grid-cols-5">
        <section className="lg:col-span-3">
          <div className="rounded-md border border-black/10 bg-white p-6 shadow-sm">
            <h2 className="font-medium">Book a table</h2>
            <form action={createReservation} className="mt-4 space-y-4">
              <label className="block">
                <div className="text-sm text-zinc-600">Name</div>
                <input
                  name="customerName"
                  required
                  className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
                  placeholder="Giulia"
                />
              </label>

              <div className="grid gap-4 sm:grid-cols-2">
                <label className="block">
                  <div className="text-sm text-zinc-600">Party size</div>
                  <input
                    name="partySize"
                    type="number"
                    min={1}
                    max={12}
                    defaultValue={2}
                    required
                    className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
                  />
                </label>
                <label className="block">
                  <div className="text-sm text-zinc-600">
                    Duration (minutes)
                  </div>
                  <input
                    name="durationMinutes"
                    type="number"
                    min={30}
                    max={240}
                    defaultValue={90}
                    required
                    className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
                  />
                </label>
              </div>

              <label className="block">
                <div className="text-sm text-zinc-600">Start time</div>
                <input
                  name="startDate"
                  type="datetime-local"
                  required
                  defaultValue={defaultStartValue}
                  className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
                />
              </label>

              <label className="block">
                <div className="text-sm text-zinc-600">Table</div>
                <select
                  name="roomTableId"
                  required
                  className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
                >
                  {tables.map((t) => (
                    <option key={t.id} value={t.id}>
                      {t.name} · {t.seats} seats · {t.room ?? "Main room"}
                    </option>
                  ))}
                </select>
              </label>

              <label className="block">
                <div className="text-sm text-zinc-600">Comment (optional)</div>
                <textarea
                  name="comment"
                  rows={3}
                  className="mt-1 w-full resize-none rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
                  placeholder="Birthday, near the window..."
                />
              </label>

              <button className="wpb-btn mt-2 w-full rounded-md px-5 py-3 text-sm font-medium">
                Reserve
              </button>
            </form>
          </div>
        </section>

        <section className="lg:col-span-2">
          <div className="rounded-md border border-black/10 bg-white p-6 text-sm text-zinc-600 shadow-sm">
            <p className="font-medium text-black">Portfolio note</p>
            <p className="mt-2">
              This is a demo flow. In a real product you&apos;d likely search
              availability automatically and require authentication for staff
              features.
            </p>
          </div>
        </section>
      </div>
    </div>
  );
}
