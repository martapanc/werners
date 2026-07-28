import { prisma } from "@/lib/prisma";
import { formatMoney } from "@/lib/money";
import { AdminContentHeader } from "@/components/admin/content-header";
import { toggleItemAvailability, updateItemPrice } from "@/app/admin/actions";

export default async function AdminMenuPage() {
  const foodClasses = await prisma.foodClass.findMany({
    orderBy: { name: "asc" },
    include: { items: { orderBy: { name: "asc" } } },
  });

  return (
    <div>
      <AdminContentHeader title="Menu Management" crumb="Menu" />

      <div className="space-y-6">
        {foodClasses.map((fc) => (
          <section key={fc.id} className="rounded-sm bg-white shadow-sm">
            <div className="border-b border-black/10 px-4 py-3 text-sm font-semibold text-zinc-900">
              {fc.name}
            </div>
            <div className="p-4">
              {fc.items.length === 0 ? (
                <div className="text-sm text-zinc-600">No items.</div>
              ) : (
                <div className="space-y-3">
                  {fc.items.map((item) => (
                    <div
                      key={item.id}
                      className="flex flex-wrap items-center justify-between gap-4 rounded-sm border border-black/10 px-4 py-3 text-sm"
                    >
                      <div>
                        <div className="font-medium">{item.name}</div>
                        <div className="mt-1 text-xs text-zinc-600">
                          {formatMoney(item.price)} ·{" "}
                          {item.available ? "Available" : "Unavailable"}
                        </div>
                      </div>

                      <div className="flex flex-wrap items-center gap-3">
                        <form action={updateItemPrice} className="flex items-center gap-2">
                          <input type="hidden" name="itemId" value={item.id} />
                          <input
                            name="price"
                            type="number"
                            step="0.1"
                            min={0}
                            max={999}
                            defaultValue={item.price}
                            className="w-24 rounded-sm border border-black/10 bg-white px-3 py-2 text-sm"
                          />
                          <button className="wpb-btn rounded-sm px-3 py-2 text-sm font-medium">
                            Save
                          </button>
                        </form>
                        <form action={toggleItemAvailability}>
                          <input type="hidden" name="itemId" value={item.id} />
                          <button className="rounded-sm border border-black/10 bg-white px-3 py-2 text-sm font-medium hover:bg-black/5">
                            Toggle
                          </button>
                        </form>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </section>
        ))}
      </div>
    </div>
  );
}

