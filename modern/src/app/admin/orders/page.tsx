import { prisma } from "@/lib/prisma";
import { formatMoney } from "@/lib/money";
import { AdminContentHeader } from "@/components/admin/content-header";
import { updateOrderStatus } from "@/app/admin/actions";

const statuses = ["RECEIVED", "PREPARING", "READY", "DELIVERED", "CANCELED"] as const;

export default async function AdminOrdersPage() {
  const orders = await prisma.takeawayOrder.findMany({
    orderBy: { id: "desc" },
    include: { items: { include: { item: true }, orderBy: { id: "asc" } } },
  });

  return (
    <div>
      <AdminContentHeader title="Takeaway Orders" crumb="Orders" />

      <div className="rounded-sm bg-white shadow-sm">
        <div className="border-b border-black/10 px-4 py-3 text-sm font-semibold text-zinc-900">
          Orders
        </div>
        <div className="p-4">
          {orders.length === 0 ? (
            <div className="text-sm text-zinc-600">No orders yet.</div>
          ) : (
            <div className="space-y-4">
              {orders.map((o) => (
                <div
                  key={o.id}
                  id={`order-${o.id}`}
                  className="rounded-sm border border-black/10"
                >
                  <div className="flex flex-wrap items-center justify-between gap-4 border-b border-black/10 bg-[#f7f7f7] px-4 py-3 text-sm">
                    <div className="font-semibold">
                      Order #{o.id}{" "}
                      <span className="font-normal text-zinc-600">
                        · {o.customerName} · {o.phoneNumber}
                      </span>
                    </div>
                    <div className="font-semibold">{formatMoney(o.cost)}</div>
                  </div>

                  <div className="grid gap-6 p-4 lg:grid-cols-5">
                    <div className="lg:col-span-3">
                      <div className="text-xs font-semibold uppercase tracking-wide text-zinc-600">
                        Items
                      </div>
                      <div className="mt-2 space-y-2 text-sm">
                        {o.items.map((line) => (
                          <div
                            key={line.id}
                            className="flex items-center justify-between gap-3 rounded-sm border border-black/10 px-3 py-2"
                          >
                            <div>
                              <div className="font-medium">{line.item.name}</div>
                              <div className="text-xs text-zinc-600">
                                Qty {line.quantity}
                                {line.comment ? ` · ${line.comment}` : ""}
                              </div>
                            </div>
                            <div className="text-xs font-semibold text-zinc-700">
                              {formatMoney(line.item.price * line.quantity)}
                            </div>
                          </div>
                        ))}
                      </div>
                      <div className="mt-3 text-sm text-zinc-600">
                        Address: <span className="text-zinc-900">{o.address}</span>
                        {o.comment ? (
                          <>
                            {" "}
                            · Comment:{" "}
                            <span className="text-zinc-900">{o.comment}</span>
                          </>
                        ) : null}
                      </div>
                    </div>

                    <div className="lg:col-span-2">
                      <div className="text-xs font-semibold uppercase tracking-wide text-zinc-600">
                        Status
                      </div>
                      <form action={updateOrderStatus} className="mt-2 space-y-2">
                        <input type="hidden" name="orderId" value={o.id} />
                        <select
                          name="status"
                          defaultValue={o.status}
                          className="w-full rounded-sm border border-black/10 bg-white px-3 py-2 text-sm"
                        >
                          {statuses.map((s) => (
                            <option key={s} value={s}>
                              {s}
                            </option>
                          ))}
                        </select>
                        <button className="wpb-btn w-full rounded-sm px-4 py-2 text-sm font-medium">
                          Update status
                        </button>
                      </form>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

