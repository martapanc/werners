import Link from "next/link";

export function DemoBanner() {
  return (
    <div className="bg-[color:var(--wpb-dark)] px-6 py-2 text-center text-xs text-white/85">
      <span className="font-medium text-white">Live demo.</span> Orders,
      reservations and menu edits all really save — the database is wiped and
      re-seeded every hour, so nothing you do here sticks around.{" "}
      <Link href="/demo" className="underline underline-offset-2 hover:text-white">
        Demo accounts &amp; credentials
      </Link>
    </div>
  );
}
