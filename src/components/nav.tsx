"use client";

import { useEffect, useState } from "react";
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { useCart } from "@/components/cart-store";
import { logout } from "@/app/(auth)/actions";
import type { CurrentUser } from "@/lib/dal";

const LINKS = [
  { href: "/", label: "Home" },
  { href: "/menu", label: "Take-away Order" },
  { href: "/reservations", label: "Table Reservation" },
];

export function Nav({ user }: { user: CurrentUser | null }) {
  const { totalCount } = useCart();
  const [menuOpen, setMenuOpen] = useState(false);
  const pathname = usePathname();

  useEffect(() => {
    if (!menuOpen) return;
    const onKeyDown = (event: KeyboardEvent) => {
      if (event.key === "Escape") setMenuOpen(false);
    };
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, [menuOpen]);

  return (
    <header className="sticky top-0 z-30 border-b border-black/10 bg-[var(--wpb-red)] text-white">
      <div className="mx-auto flex max-w-5xl items-center justify-between gap-4 px-4 py-3 sm:px-6">
        <Link href="/" className="flex shrink-0 items-center gap-3">
          <Image
            src="/legacy/img/burger-160x160.jpg"
            alt=""
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

        {/* Desktop navigation. Below `md` these move into the panel underneath:
            at phone widths they used to wrap to three lines and push "Sign in"
            off the right edge of the screen. */}
        <nav className="hidden items-center gap-1 text-sm md:flex">
          {LINKS.map((link) => (
            <Link
              key={link.href}
              href={link.href}
              aria-current={pathname === link.href ? "page" : undefined}
              className="rounded-md px-3 py-2 hover:bg-black/10 aria-[current=page]:bg-black/15"
            >
              {link.label}
            </Link>
          ))}
          <Link
            href="/checkout"
            className="rounded-md bg-black/15 px-3 py-2 hover:bg-black/25"
          >
            Cart ({totalCount})
          </Link>

          {user?.role === "ADMIN" ? (
            <Link href="/admin" className="rounded-md px-3 py-2 hover:bg-black/10">
              Admin
            </Link>
          ) : null}

          {user ? (
            <div className="ml-2 flex items-center gap-2 border-l border-white/25 pl-3">
              <span className="hidden opacity-90 lg:inline">{user.fullName}</span>
              <form action={logout}>
                <button
                  type="submit"
                  className="cursor-pointer rounded-md px-3 py-2 hover:bg-black/10"
                >
                  Sign out
                </button>
              </form>
            </div>
          ) : (
            <div className="ml-2 flex items-center gap-1 border-l border-white/25 pl-3">
              <Link href="/login" className="rounded-md px-3 py-2 hover:bg-black/10">
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

        {/* Mobile: the cart stays in the bar so its count is always visible;
            everything else folds into the toggle. */}
        <div className="flex items-center gap-1.5 md:hidden">
          <Link
            href="/checkout"
            aria-label={`Cart, ${totalCount} item${totalCount === 1 ? "" : "s"}`}
            className="flex items-center gap-1.5 rounded-md bg-black/15 px-3 py-2 text-sm hover:bg-black/25"
          >
            <svg
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth={2}
              strokeLinecap="round"
              strokeLinejoin="round"
              className="h-4 w-4"
              aria-hidden
            >
              <circle cx="9" cy="20" r="1.5" />
              <circle cx="18" cy="20" r="1.5" />
              <path d="M2 3h3l2.4 11.2a2 2 0 0 0 2 1.6h7.7a2 2 0 0 0 2-1.55L21 7H6" />
            </svg>
            <span className="tabular-nums">{totalCount}</span>
          </Link>

          <button
            type="button"
            onClick={() => setMenuOpen((open) => !open)}
            aria-expanded={menuOpen}
            aria-controls="mobile-menu"
            aria-label={menuOpen ? "Close menu" : "Open menu"}
            className="inline-flex h-10 w-10 cursor-pointer items-center justify-center rounded-md hover:bg-black/10"
          >
            <svg
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth={2}
              strokeLinecap="round"
              className="h-5 w-5"
              aria-hidden
            >
              {menuOpen ? (
                <>
                  <path d="M6 6l12 12" />
                  <path d="M18 6L6 18" />
                </>
              ) : (
                <>
                  <path d="M3 6h18" />
                  <path d="M3 12h18" />
                  <path d="M3 18h18" />
                </>
              )}
            </svg>
          </button>
        </div>
      </div>

      {menuOpen ? (
        <div
          id="mobile-menu"
          className="border-t border-white/15 bg-[var(--wpb-red-dark)] md:hidden"
        >
          {/* One delegated handler closes the panel on any activation inside
              it, so the menu never stays open over the page just navigated to. */}
          <nav
            onClick={() => setMenuOpen(false)}
            className="mx-auto flex max-w-5xl flex-col px-4 py-2 text-sm sm:px-6"
          >
            {LINKS.map((link) => (
              <Link
                key={link.href}
                href={link.href}
                aria-current={pathname === link.href ? "page" : undefined}
                className="rounded-md px-3 py-3 hover:bg-black/15 aria-[current=page]:bg-black/20"
              >
                {link.label}
              </Link>
            ))}

            {user?.role === "ADMIN" ? (
              <Link href="/admin" className="rounded-md px-3 py-3 hover:bg-black/15">
                Admin panel
              </Link>
            ) : null}

            <div className="my-2 border-t border-white/15" />

            {user ? (
              <>
                <p className="px-3 py-2 text-white/75">
                  Signed in as{" "}
                  <span className="font-medium text-white">{user.fullName}</span>
                </p>
                <form action={logout}>
                  <button
                    type="submit"
                    className="w-full cursor-pointer rounded-md px-3 py-3 text-left hover:bg-black/15"
                  >
                    Sign out
                  </button>
                </form>
              </>
            ) : (
              <>
                <Link href="/login" className="rounded-md px-3 py-3 hover:bg-black/15">
                  Sign in
                </Link>
                <Link href="/demo" className="rounded-md px-3 py-3 hover:bg-black/15">
                  Demo accounts
                </Link>
              </>
            )}
          </nav>
        </div>
      ) : null}
    </header>
  );
}
