"use client";

import Image from "next/image";
import Link from "next/link";
import { useCart } from "@/components/cart-store";
import { logout } from "@/app/(auth)/actions";
import type { CurrentUser } from "@/lib/dal";

export function Nav({ user }: { user: CurrentUser | null }) {
  const { totalCount } = useCart();

  return (
    <header className="sticky top-0 z-10 border-b border-black/10 bg-[var(--wpb-red)] text-white">
      <div className="mx-auto flex max-w-5xl items-center justify-between gap-6 px-6 py-3">
        <Link href="/" className="flex items-center gap-3">
          <Image
            src="/legacy/img/burger-160x160.jpg"
            alt="WPB"
            width={40}
            height={40}
            className="h-10 w-10 rounded-full border border-white/30 object-cover"
          />
          <div className="leading-tight">
            <div className="text-base font-semibold tracking-tight">
              Werner&apos;s{" "}
              <span className="text-sm font-medium opacity-90">
                Panini&amp;Burgers
              </span>
            </div>
          </div>
        </Link>

        <nav className="flex items-center gap-1 text-sm">
          <Link href="/" className="rounded-md px-3 py-2 hover:bg-black/10">
            Home
          </Link>
          <Link href="/menu" className="rounded-md px-3 py-2 hover:bg-black/10">
            Take-away Order
          </Link>
          <Link
            href="/reservations"
            className="rounded-md px-3 py-2 hover:bg-black/10"
          >
            Table Reservation
          </Link>
          <Link
            href="/checkout"
            className="rounded-md bg-black/15 px-3 py-2 hover:bg-black/25"
          >
            Cart ({totalCount})
          </Link>

          {user?.role === "ADMIN" ? (
            <Link
              href="/admin"
              className="rounded-md px-3 py-2 hover:bg-black/10"
            >
              Admin
            </Link>
          ) : null}

          {user ? (
            <div className="ml-2 flex items-center gap-2 border-l border-white/25 pl-3">
              <span className="hidden opacity-90 sm:inline">
                {user.fullName}
              </span>
              <form action={logout}>
                <button
                  type="submit"
                  className="rounded-md px-3 py-2 hover:bg-black/10"
                >
                  Sign out
                </button>
              </form>
            </div>
          ) : (
            <div className="ml-2 flex items-center gap-1 border-l border-white/25 pl-3">
              <Link
                href="/login"
                className="rounded-md px-3 py-2 hover:bg-black/10"
              >
                Sign in
              </Link>
              <Link
                href="/demo"
                className="rounded-md bg-black/15 px-3 py-2 hover:bg-black/25"
              >
                Demo
              </Link>
            </div>
          )}
        </nav>
      </div>
    </header>
  );
}
