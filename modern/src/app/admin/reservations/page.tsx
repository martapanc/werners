import { prisma } from "@/lib/prisma";
import { AdminContentHeader } from "@/components/admin/content-header";
import { deleteReservation } from "@/app/admin/actions";

export default async function AdminReservationsPage() {
  const reservations = await prisma.reservation.findMany({
    orderBy: { startDate: "desc" },
    include: { roomTable: true },
  });

  return (
    <div>
      <AdminContentHeader title="Reservations" crumb="Reservations" />

      <div className="rounded-sm bg-white shadow-sm">
        <div className="border-b border-black/10 px-4 py-3 text-sm font-semibold text-zinc-900">
          Reservations
        </div>
        <div className="p-4">
          {reservations.length === 0 ? (
            <div className="text-sm text-zinc-600">No reservations yet.</div>
          ) : (
            <div className="space-y-3">
              {reservations.map((r) => (
                <div
                  key={r.id}
                  className="flex flex-wrap items-center justify-between gap-4 rounded-sm border border-black/10 px-4 py-3 text-sm"
                >
                  <div>
                    <div className="font-semibold">
                      #{r.id} · {r.customerName}{" "}
                      <span className="font-normal text-zinc-600">
                        · party {r.partySize} · {r.roomTable.name}
                      </span>
                    </div>
                    <div className="mt-1 text-xs text-zinc-600">
                      {r.startDate.toLocaleString()} → {r.endDate.toLocaleString()}
                      {r.comment ? ` · ${r.comment}` : ""}
                    </div>
                  </div>
                  <form action={deleteReservation}>
                    <input type="hidden" name="reservationId" value={r.id} />
                    <button className="rounded-sm border border-black/10 bg-white px-3 py-2 text-xs font-semibold text-zinc-800 hover:bg-black/5">
                      Delete
                    </button>
                  </form>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

