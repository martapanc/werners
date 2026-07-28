import Link from "next/link";
import { prisma } from "@/lib/prisma";
import { formatMoney } from "@/lib/money";
import { AdminContentHeader } from "@/components/admin/content-header";
import { InfoBox } from "@/components/admin/info-box";

export default async function AdminDashboardPage() {
  const [orderCount, reservationCount, itemCount, revenueAgg] =
    await Promise.all([
      prisma.takeawayOrder.count(),
      prisma.reservation.count(),
      prisma.item.count(),
      prisma.takeawayOrder.aggregate({ _sum: { cost: true } }),
    ]);

  const revenue = revenueAgg._sum.cost ?? 0;

  const recentOrders = await prisma.takeawayOrder.findMany({
    orderBy: { id: "desc" },
    take: 5,
    include: { items: { include: { item: true } } },
  });

  const upcomingReservations = await prisma.reservation.findMany({
    orderBy: { startDate: "asc" },
    take: 5,
    include: { roomTable: true },
    where: { startDate: { gte: new Date() } },
  });

  return (
    <div>
      <AdminContentHeader title="Dashboard" crumb="Dashboard" />

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        <InfoBox color="#00c0ef" icon="⚙" label="Revenue" value={formatMoney(revenue)} />
        <InfoBox
          color="var(--wpb-red)"
          icon="✚"
          label="Orders"
          value={String(orderCount)}
        />
        <InfoBox color="#00a65a" icon="🛒" label="Menu Items" value={String(itemCount)} />
        <InfoBox
          color="#f39c12"
          icon="👥"
          label="Reservations"
          value={String(reservationCount)}
        />
      </div>

      <div className="mt-6 grid gap-6 lg:grid-cols-2">
        <section className="rounded-sm bg-white shadow-sm">
          <div className="border-b border-black/10 px-4 py-3">
            <div className="text-sm font-semibold text-zinc-900">
              Recent takeaway orders
            </div>
          </div>
          <div className="p-4">
            {recentOrders.length === 0 ? (
              <div className="text-sm text-zinc-600">No orders yet.</div>
            ) : (
              <div className="space-y-3">
                {recentOrders.map((o) => (
                  <div
                    key={o.id}
                    className="flex items-start justify-between gap-4 rounded-sm border border-black/10 p-3 text-sm"
                  >
                    <div>
                      <div className="font-medium">
                        <Link href={`/admin/orders#order-${o.id}`} className="hover:underline">
                          Order #{o.id}
                        </Link>{" "}
                        <span className="text-zinc-600">· {o.status}</span>
                      </div>
                      <div className="mt-1 text-zinc-600">
                        {o.customerName} · {o.phoneNumber}
                      </div>
                      <div className="mt-1 text-zinc-600">
                        {o.items.slice(0, 2).map((i) => i.item.name).join(", ")}
                        {o.items.length > 2 ? ` +${o.items.length - 2} more` : ""}
                      </div>
                    </div>
                    <div className="font-semibold">{formatMoney(o.cost)}</div>
                  </div>
                ))}
              </div>
            )}
            <div className="mt-4">
              <Link href="/admin/orders" className="text-sm text-[color:var(--wpb-red)] hover:underline">
                View all orders →
              </Link>
            </div>
          </div>
        </section>

        <section className="rounded-sm bg-white shadow-sm">
          <div className="border-b border-black/10 px-4 py-3">
            <div className="text-sm font-semibold text-zinc-900">
              Upcoming reservations
            </div>
          </div>
          <div className="p-4">
            {upcomingReservations.length === 0 ? (
              <div className="text-sm text-zinc-600">No upcoming reservations.</div>
            ) : (
              <div className="space-y-3">
                {upcomingReservations.map((r) => (
                  <div
                    key={r.id}
                    className="flex items-start justify-between gap-4 rounded-sm border border-black/10 p-3 text-sm"
                  >
                    <div>
                      <div className="font-medium">
                        {r.customerName}{" "}
                        <span className="text-zinc-600">· party {r.partySize}</span>
                      </div>
                      <div className="mt-1 text-zinc-600">
                        {r.startDate.toLocaleString()} → {r.endDate.toLocaleString()}
                      </div>
                      <div className="mt-1 text-zinc-600">
                        {r.roomTable.name} · {r.roomTable.seats} seats
                      </div>
                    </div>
                    <div className="text-xs font-semibold text-zinc-600">
                      #{r.id}
                    </div>
                  </div>
                ))}
              </div>
            )}
            <div className="mt-4">
              <Link href="/admin/reservations" className="text-sm text-[color:var(--wpb-red)] hover:underline">
                View all reservations →
              </Link>
            </div>
          </div>
        </section>
      </div>
    </div>
  );
}

