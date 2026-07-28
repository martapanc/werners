import { prisma } from "@/lib/prisma";
import { formatMoney } from "@/lib/money";
import Link from "next/link";
import { notFound } from "next/navigation";

export default async function OrderPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const orderId = Number(id);
  if (!Number.isFinite(orderId)) notFound();

  const order = await prisma.takeawayOrder.findUnique({
    where: { id: orderId },
    include: { items: { include: { item: true }, orderBy: { id: "asc" } } },
  });
  if (!order) notFound();

  return (
    <div className="mx-auto w-full max-w-5xl px-6 py-12">
      <div className="flex items-center justify-between gap-6">
        <div>
          <h1 className="text-3xl font-semibold tracking-tight">
            Order #{order.id}
          </h1>
          <p className="mt-2 text-sm text-zinc-600">Status: {order.status}</p>
        </div>
        <Link
          href="/menu"
          className="rounded-md border border-black/10 px-5 py-3 text-sm font-medium hover:bg-black/5"
        >
          Back to menu
        </Link>
      </div>

      <div className="mt-8 grid gap-6 lg:grid-cols-5">
        <section className="lg:col-span-3">
          <div className="rounded-md border border-black/10 bg-white p-6 shadow-sm">
            <h2 className="font-medium">Items</h2>
            <div className="mt-4 space-y-3">
              {order.items.map((line) => (
                <div
                  key={line.id}
                  className="flex items-center justify-between gap-4 rounded-md border border-black/10 p-4"
                >
                  <div>
                    <div className="font-medium">{line.item.name}</div>
                    <div className="mt-1 text-sm text-zinc-600">
                      Qty {line.quantity} · {formatMoney(line.item.price)}
                    </div>
                  </div>
                  <div className="text-sm font-medium">
                    {formatMoney(line.item.price * line.quantity)}
                  </div>
                </div>
              ))}
            </div>
            <div className="mt-6 flex items-center justify-between text-sm">
              <span className="text-zinc-600">Total</span>
              <span className="font-medium">{formatMoney(order.cost)}</span>
            </div>
          </div>
        </section>

        <section className="lg:col-span-2">
          <div className="rounded-md border border-black/10 bg-white p-6 shadow-sm">
            <h2 className="font-medium">Delivery</h2>
            <dl className="mt-4 space-y-3 text-sm">
              <div>
                <dt className="text-zinc-600">Name</dt>
                <dd className="font-medium">{order.customerName}</dd>
              </div>
              <div>
                <dt className="text-zinc-600">Phone</dt>
                <dd className="font-medium">{order.phoneNumber}</dd>
              </div>
              <div>
                <dt className="text-zinc-600">Address</dt>
                <dd className="font-medium">{order.address}</dd>
              </div>
              {order.comment ? (
                <div>
                  <dt className="text-zinc-600">Comment</dt>
                  <dd className="font-medium">{order.comment}</dd>
                </div>
              ) : null}
            </dl>
          </div>
        </section>
      </div>
    </div>
  );
}
