import { prisma } from "@/lib/prisma";
import { formatMoney } from "@/lib/money";
import { AddToCartButton } from "@/components/menu/add-to-cart-button";
import Image from "next/image";
import { PublicContentHeader } from "@/components/public/content-header";

export default async function MenuPage() {
  const foodClasses = await prisma.foodClass.findMany({
    orderBy: { sortOrder: "asc" },
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
            <div className="flex items-baseline justify-between gap-4 border-b border-black/10 pb-3">
              <h2 className="text-3xl font-semibold tracking-tight text-[#444]">
                {fc.name}
              </h2>
              <span className="text-sm text-zinc-500">
                {fc.items.length} {fc.items.length === 1 ? "item" : "items"}
              </span>
            </div>
            <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
              {fc.items.map((item) => (
                <div
                  key={item.id}
                  className="overflow-hidden rounded-sm border border-black/10 bg-white shadow-sm"
                >
                  {item.image ? (
                    <div className="relative aspect-[4/3] w-full bg-zinc-100">
                      <Image
                        src={item.image}
                        alt={item.name}
                        fill
                        sizes="(min-width: 1024px) 21rem, (min-width: 640px) 50vw, 100vw"
                        className={[
                          "object-cover",
                          // Unavailable dishes stay visible but read as off-menu.
                          item.available ? "" : "opacity-45 grayscale",
                        ].join(" ")}
                      />
                    </div>
                  ) : null}

                  <div className="flex items-start justify-between gap-3 p-5">
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
