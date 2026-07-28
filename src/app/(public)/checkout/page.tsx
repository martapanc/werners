"use client";

import { useMemo, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { useCart } from "@/components/cart-store";
import { formatMoney } from "@/lib/money";
import { placeTakeawayOrder } from "@/app/actions";
import { PublicContentHeader } from "@/components/public/content-header";

export default function CheckoutPage() {
  const { lines, setQuantity, removeLine, clear, subtotal, totalCount } =
    useCart();
  const router = useRouter();
  const [error, setError] = useState<string | null>(null);
  const [pending, startTransition] = useTransition();

  const normalizedCart = useMemo(
    () => lines.map((l) => ({ itemId: l.itemId, quantity: l.quantity })),
    [lines]
  );

  /**
   * Submitting by hand rather than with `useActionState` so the cart can be
   * emptied between the order succeeding and the redirect firing — the point
   * where the order exists but we have not navigated yet. Doing it in an effect
   * afterwards would be a state update reacting to a render, and doing it
   * optimistically on submit would wrongly discard the cart when the order is
   * rejected.
   */
  function onSubmit(formData: FormData) {
    setError(null);
    startTransition(async () => {
      const result = await placeTakeawayOrder(formData);
      if ("error" in result) {
        setError(result.error);
        return;
      }
      clear();
      router.push(`/orders/${result.orderId}`);
    });
  }

  return (
    <div className="mx-auto w-full max-w-5xl px-6 py-12">
      <PublicContentHeader title="Checkout" crumb="Checkout" />
      <p className="-mt-4 text-sm text-zinc-600">
        Orders are saved to the database via a server action.
      </p>

      <div className="mt-8 grid gap-8 lg:grid-cols-5">
        <section className="lg:col-span-3">
          <div className="rounded-md border border-black/10 bg-white p-6 shadow-sm">
            <div className="flex items-center justify-between">
              <h2 className="font-medium">Your cart</h2>
              <button
                type="button"
                onClick={() => clear()}
                className="text-sm text-zinc-600 hover:text-black disabled:opacity-40"
                disabled={lines.length === 0}
              >
                Clear
              </button>
            </div>

            <div className="mt-4 space-y-3">
              {lines.length === 0 ? (
                <div className="rounded-md border border-dashed border-black/10 p-6 text-sm text-zinc-600">
                  Your cart is empty. Add something from the menu.
                </div>
              ) : (
                lines.map((line) => (
                  <div
                    key={line.itemId}
                    className="flex items-center justify-between gap-4 rounded-md border border-black/10 p-4"
                  >
                    <div>
                      <div className="font-medium">{line.name}</div>
                      <div className="mt-1 text-sm text-zinc-600">
                        {formatMoney(line.price)} each
                      </div>
                    </div>
                    <div className="flex items-center gap-3">
                      <input
                        className="w-16 rounded-md border border-black/10 bg-white px-3 py-2 text-sm"
                        type="number"
                        min={1}
                        max={99}
                        value={line.quantity}
                        onChange={(e) =>
                          setQuantity(line.itemId, Number(e.target.value))
                        }
                      />
                      <button
                        type="button"
                        className="rounded-md px-3 py-2 text-sm hover:bg-black/5"
                        onClick={() => removeLine(line.itemId)}
                      >
                        Remove
                      </button>
                    </div>
                  </div>
                ))
              )}
            </div>

            <div className="mt-6 flex items-center justify-between text-sm">
              <span className="text-zinc-600">
                Subtotal ({totalCount} items)
              </span>
              <span className="font-medium">{formatMoney(subtotal)}</span>
            </div>
          </div>
        </section>

        <section className="lg:col-span-2">
          <div className="rounded-md border border-black/10 bg-white p-6 shadow-sm">
            <h2 className="font-medium">Delivery details</h2>

            {error ? (
              <div
                role="alert"
                className="mt-4 rounded-md border border-[color:var(--wpb-red)]/30 bg-[color:var(--wpb-red)]/10 px-3 py-3 text-sm text-[color:var(--wpb-red-dark)]"
              >
                <p>{error}</p>
                <button
                  type="button"
                  onClick={() => {
                    clear();
                    setError(null);
                  }}
                  className="mt-2 font-medium underline underline-offset-2"
                >
                  Clear the cart
                </button>
              </div>
            ) : null}

            <form action={onSubmit} className="mt-4 space-y-4">
              <input
                type="hidden"
                name="cartJson"
                value={JSON.stringify(normalizedCart)}
              />

              <label className="block">
                <div className="text-sm text-zinc-600">Name</div>
                <input
                  name="customerName"
                  required
                  className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
                  placeholder="Chuck Norris"
                />
              </label>

              <label className="block">
                <div className="text-sm text-zinc-600">Phone</div>
                <input
                  name="phoneNumber"
                  required
                  className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
                  placeholder="+39 333 123 4567"
                />
              </label>

              <label className="block">
                <div className="text-sm text-zinc-600">Address</div>
                <input
                  name="address"
                  required
                  className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
                  placeholder="221B Baker St"
                />
              </label>

              <label className="block">
                <div className="text-sm text-zinc-600">Comment (optional)</div>
                <textarea
                  name="comment"
                  rows={3}
                  className="mt-1 w-full resize-none rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
                  placeholder="No onions, please."
                />
              </label>

              <button
                disabled={lines.length === 0 || pending}
                className="wpb-btn mt-2 w-full rounded-md px-5 py-3 text-sm font-medium disabled:cursor-not-allowed disabled:opacity-40"
              >
                {pending ? "Placing order…" : "Place order"}
              </button>
            </form>
          </div>
        </section>
      </div>
    </div>
  );
}
