"use client";

import {
  createContext,
  useCallback,
  useContext,
  useMemo,
  useState,
} from "react";

export type CartLine = {
  itemId: number;
  name: string;
  price: number;
  quantity: number;
};

type CartContextValue = {
  lines: CartLine[];
  addLine: (line: Omit<CartLine, "quantity">) => void;
  setQuantity: (itemId: number, quantity: number) => void;
  removeLine: (itemId: number) => void;
  clear: () => void;
  totalCount: number;
  subtotal: number;
};

const CartContext = createContext<CartContextValue | null>(null);
const CART_KEY = "wpb_cart_v1";

function readCart(): CartLine[] {
  if (typeof window === "undefined") return [];
  try {
    const raw = window.localStorage.getItem(CART_KEY);
    if (!raw) return [];
    const parsed = JSON.parse(raw);
    if (!Array.isArray(parsed)) return [];
    return parsed
      .map((line) => ({
        itemId: Number(line.itemId),
        name: String(line.name),
        price: Number(line.price),
        quantity: Number(line.quantity),
      }))
      .filter((l) => Number.isFinite(l.itemId) && l.quantity > 0);
  } catch {
    return [];
  }
}

function writeCart(lines: CartLine[]) {
  window.localStorage.setItem(CART_KEY, JSON.stringify(lines));
}

export function CartProvider({ children }: { children: React.ReactNode }) {
  const [lines, setLines] = useState<CartLine[]>(() => readCart());

  const persist = useCallback((updater: (prev: CartLine[]) => CartLine[]) => {
    setLines((prev) => {
      const next = updater(prev);
      writeCart(next);
      return next;
    });
  }, []);

  const addLine = useCallback(
    (line: Omit<CartLine, "quantity">) => {
      persist((prev) => {
        const existing = prev.find((l) => l.itemId === line.itemId);
        if (!existing) return [...prev, { ...line, quantity: 1 }];
        return prev.map((l) =>
          l.itemId === line.itemId ? { ...l, quantity: l.quantity + 1 } : l
        );
      });
    },
    [persist]
  );

  const setQuantity = useCallback(
    (itemId: number, quantity: number) => {
      persist((prev) =>
        prev
          .map((l) => (l.itemId === itemId ? { ...l, quantity } : l))
          .filter((l) => l.quantity > 0)
      );
    },
    [persist]
  );

  const removeLine = useCallback(
    (itemId: number) => {
      persist((prev) => prev.filter((l) => l.itemId !== itemId));
    },
    [persist]
  );

  const clear = useCallback(() => persist(() => []), [persist]);

  const { totalCount, subtotal } = useMemo(() => {
    const count = lines.reduce((acc, l) => acc + l.quantity, 0);
    const money = lines.reduce((acc, l) => acc + l.price * l.quantity, 0);
    return { totalCount: count, subtotal: money };
  }, [lines]);

  const value: CartContextValue = useMemo(
    () => ({
      lines,
      addLine,
      setQuantity,
      removeLine,
      clear,
      totalCount,
      subtotal,
    }),
    [addLine, clear, lines, removeLine, setQuantity, subtotal, totalCount]
  );

  return <CartContext.Provider value={value}>{children}</CartContext.Provider>;
}

export function useCart() {
  const ctx = useContext(CartContext);
  if (!ctx) throw new Error("useCart must be used within CartProvider");
  return ctx;
}
