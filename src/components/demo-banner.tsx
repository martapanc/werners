import Link from "next/link";

export function DemoBanner() {
  return (
    <div className="bg-[color:var(--wpb-dark)] px-4 py-2 text-center text-xs text-white/85 sm:px-6">
      <span className="font-medium text-white">Live demo.</span>{" "}
      {/* The full sentence costs three wrapped lines on a phone, so small
          screens get the short version. */}
      <span className="hidden sm:inline">
        Orders, reservations and menu edits all really save — the database is
        wiped and re-seeded every hour, so nothing you do here sticks around.{" "}
      </span>
      <span className="sm:hidden">Data resets hourly. </span>
      <Link href="/demo" className="underline underline-offset-2 hover:text-white">
        Demo accounts
      </Link>
    </div>
  );
}
