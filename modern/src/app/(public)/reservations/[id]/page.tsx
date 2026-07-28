import { prisma } from "@/lib/prisma";
import Link from "next/link";
import { notFound } from "next/navigation";

export default async function ReservationPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const reservationId = Number(id);
  if (!Number.isFinite(reservationId)) notFound();

  const reservation = await prisma.reservation.findUnique({
    where: { id: reservationId },
    include: { roomTable: true },
  });
  if (!reservation) notFound();

  return (
    <div className="mx-auto w-full max-w-5xl px-6 py-12">
      <div className="rounded-md border border-black/10 bg-white p-10 shadow-sm">
        <p className="text-sm font-medium text-zinc-600">
          Reservation confirmed
        </p>
        <h1 className="mt-3 text-3xl font-semibold tracking-tight">
          {reservation.customerName}
        </h1>
        <div className="mt-4 grid gap-4 text-sm sm:grid-cols-2">
          <div>
            <div className="text-zinc-600">Table</div>
            <div className="font-medium">
              {reservation.roomTable.name} · {reservation.roomTable.seats} seats
            </div>
          </div>
          <div>
            <div className="text-zinc-600">Party size</div>
            <div className="font-medium">{reservation.partySize}</div>
          </div>
          <div>
            <div className="text-zinc-600">Start</div>
            <div className="font-medium">
              {reservation.startDate.toLocaleString()}
            </div>
          </div>
          <div>
            <div className="text-zinc-600">End</div>
            <div className="font-medium">
              {reservation.endDate.toLocaleString()}
            </div>
          </div>
          {reservation.comment ? (
            <div className="sm:col-span-2">
              <div className="text-zinc-600">Comment</div>
              <div className="font-medium">{reservation.comment}</div>
            </div>
          ) : null}
        </div>

        <div className="mt-8 flex flex-col gap-3 sm:flex-row">
          <Link
            href="/menu"
            className="wpb-btn inline-flex items-center justify-center rounded-md px-6 py-3 text-sm font-medium"
          >
            Order takeaway
          </Link>
          <Link
            href="/reservations"
            className="inline-flex items-center justify-center rounded-md border border-black/10 px-6 py-3 text-sm font-medium hover:bg-black/5"
          >
            Make another reservation
          </Link>
        </div>
      </div>
    </div>
  );
}
