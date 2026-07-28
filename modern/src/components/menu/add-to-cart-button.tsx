"use client";

import { useCart } from "@/components/cart-store";

export function AddToCartButton({
  itemId,
  name,
  price,
  disabled,
}: {
  itemId: number;
  name: string;
  price: number;
  disabled?: boolean;
}) {
  const { addLine } = useCart();

  return (
    <button
      type="button"
      disabled={disabled}
      onClick={() => addLine({ itemId, name, price })}
      className="wpb-btn rounded-md px-4 py-2 text-sm font-medium disabled:cursor-not-allowed disabled:opacity-40"
    >
      Add
    </button>
  );
}
