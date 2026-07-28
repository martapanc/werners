import { prisma } from "@/lib/prisma";
import { BookingForm } from "@/components/reservations/booking-form";
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
            <BookingForm
              tables={tables}
              defaultStartValue={defaultStartValue}
            />
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
