import { prisma } from "@/lib/prisma";
import { formatMoney } from "@/lib/money";
import { AddToCartButton } from "@/components/menu/add-to-cart-button";
import Image from "next/image";
import { PublicContentHeader } from "@/components/public/content-header";

export default async function MenuPage() {
  const foodClasses = await prisma.foodClass.findMany({
    orderBy: { name: "asc" },
    include: { items: { orderBy: { name: "asc" } } },
  });

  return (
    <div className="mx-auto w-full max-w-5xl px-6 py-12">
      <PublicContentHeader title="Take-away Order" crumb="Take-away Order" />
      <p className="-mt-4 text-sm text-zinc-600">
        Seeded demo data, based on the original project.
      </p>

      <div className="mt-10 space-y-10">
        {foodClasses.map((fc) => (
          <section key={fc.id}>
            <div className="flex items-center gap-3">
              {fc.image ? (
                <Image
                  src={fc.image}
                  alt=""
                  width={24}
                  height={24}
                  className="h-6 w-6 opacity-80"
                />
              ) : null}
              <h2 className="text-lg font-medium">{fc.name}</h2>
            </div>
            <div className="mt-4 grid gap-4 sm:grid-cols-2">
              {fc.items.map((item) => (
                <div
                  key={item.id}
                  className="rounded-sm border border-black/10 bg-white p-5 shadow-sm"
                >
                  <div className="flex items-start justify-between gap-3">
                    <div>
                      <div className="font-medium">{item.name}</div>
                      <div className="mt-1 text-sm text-zinc-600">
                        {formatMoney(item.price)}
                        {!item.available ? " · Unavailable" : null}
                      </div>
                    </div>
                    <AddToCartButton
                      itemId={item.id}
                      name={item.name}
                      price={item.price}
                      disabled={!item.available}
                    />
                  </div>
                </div>
              ))}
            </div>
          </section>
        ))}
      </div>
    </div>
  );
}
