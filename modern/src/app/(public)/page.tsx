import Link from "next/link";
import { HeroSlider } from "@/components/hero-slider";

export default async function Home({
  searchParams,
}: {
  searchParams: Promise<{ error?: string }>;
}) {
  // Set when requireAdmin() bounces a signed-in customer away from /admin.
  const { error } = await searchParams;

  return (
    <div>
      <HeroSlider />

      <div className="mx-auto w-full max-w-5xl px-6 py-12">
        {error === "admin-only" ? (
          <p
            role="alert"
            className="mb-6 rounded-md border border-[color:var(--wpb-red)]/30 bg-[color:var(--wpb-red)]/10 px-4 py-3 text-sm text-[color:var(--wpb-red-dark)]"
          >
            The admin panel is restricted to staff accounts. Sign in with the{" "}
            <Link href="/demo" className="font-medium underline underline-offset-2">
              demo administrator account
            </Link>{" "}
            to explore it.
          </p>
        ) : null}

        <section className="rounded-md border border-black/10 bg-white p-8 shadow-sm">
          <div className="flex flex-col items-start justify-between gap-6 sm:flex-row sm:items-center">
            <div>
              <h2 className="text-xl font-semibold tracking-tight">
                Werner&apos;s Panini&amp;Burgers
              </h2>
              <p className="mt-2 text-sm text-zinc-600">
                Modern rebuild with the original skin-red vibe.
              </p>
            </div>
            <div className="flex gap-3">
              <Link
                href="/menu"
                className="wpb-btn inline-flex items-center justify-center rounded-md px-5 py-3 text-sm font-medium"
              >
                Take-away Order
              </Link>
              <Link
                href="/reservations"
                className="inline-flex items-center justify-center rounded-md border border-black/10 px-5 py-3 text-sm font-medium hover:bg-black/5"
              >
                Table Reservation
              </Link>
            </div>
          </div>
        </section>
      </div>
    </div>
  );
}
