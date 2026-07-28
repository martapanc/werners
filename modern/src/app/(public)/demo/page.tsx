import Link from "next/link";
import { loginAsDemoAccount } from "@/app/(auth)/actions";
import { PublicContentHeader } from "@/components/public/content-header";
import { DEMO_ACCOUNTS } from "@/lib/demo-data";
import { getCurrentUser } from "@/lib/dal";

export const metadata = {
  title: "Demo accounts · Werner's Panini & Burgers",
};

const roleBlurb: Record<string, { title: string; description: string; tour: string[] }> = {
  CUSTOMER: {
    title: "Customer",
    description:
      "The everyday diner's view: browse the menu, fill a cart, place a take-away order and book a table.",
    tour: [
      "Browse the menu and add a few items to the cart",
      "Check out — you'll get a real order confirmation page",
      "Book a table and watch the double-booking check reject overlaps",
    ],
  },
  ADMIN: {
    title: "Administrator",
    description:
      "The staff back office, rebuilt from the original AdminLTE panel: manage orders, menu and reservations.",
    tour: [
      "Move an order through its lifecycle (received → preparing → ready → delivered)",
      "Toggle a dish's availability or edit its price, then view it on the public menu",
      "Cancel a reservation from the bookings table",
    ],
  },
};

export default async function DemoPage() {
  const user = await getCurrentUser();

  return (
    <div className="mx-auto w-full max-w-5xl px-6 py-12">
      <PublicContentHeader title="Demo accounts" crumb="Demo accounts" />

      <div className="mt-4">
        <div className="rounded-lg border border-black/10 bg-white p-5 shadow-sm">
          <h2 className="text-base font-semibold">About this demo</h2>
          <p className="mt-2 text-sm leading-6 text-black/70">
            This is a modern rebuild of a 2016–17 university project — originally
            Java servlets, JSP, Hibernate and MySQL on Tomcat, now Next.js,
            Prisma and Postgres. Everything you do here writes to a real
            database, so orders, reservations and menu edits behave exactly as
            they would in production.
          </p>
          <p className="mt-3 text-sm leading-6 text-black/70">
            <strong className="font-semibold">Nothing you change is permanent.</strong>{" "}
            A scheduled job wipes the database and re-seeds the original demo
            data every hour, so feel free to break things. Because everyone
            shares one database, you may occasionally see orders left behind by
            another visitor.
          </p>
        </div>

        {user ? (
          <p className="mt-6 rounded-md border border-black/10 bg-white px-4 py-3 text-sm text-black/70">
            You&apos;re signed in as{" "}
            <strong className="font-semibold">{user.fullName}</strong> ({user.role.toLowerCase()}).
            Sign out from the navbar to switch accounts.
          </p>
        ) : null}

        <div className="mt-6 grid gap-5 md:grid-cols-2">
          {DEMO_ACCOUNTS.map((account) => {
            const blurb = roleBlurb[account.role];
            return (
              <section
                key={account.email}
                className="flex flex-col rounded-lg border border-black/10 bg-white p-5 shadow-sm"
              >
                <div className="flex items-center justify-between">
                  <h2 className="text-lg font-semibold tracking-tight">
                    {blurb.title}
                  </h2>
                  <span className="rounded-full bg-[color:var(--wpb-red)]/10 px-2.5 py-1 text-xs font-medium text-[color:var(--wpb-red-dark)]">
                    {account.role}
                  </span>
                </div>

                <p className="mt-2 text-sm leading-6 text-black/70">
                  {blurb.description}
                </p>

                <dl className="mt-4 space-y-2 rounded-md bg-[#f6f6f6] p-3 text-sm">
                  <div className="flex items-baseline justify-between gap-3">
                    <dt className="text-black/55">Email</dt>
                    <dd className="font-mono text-[13px]">{account.email}</dd>
                  </div>
                  <div className="flex items-baseline justify-between gap-3">
                    <dt className="text-black/55">Password</dt>
                    <dd className="font-mono text-[13px]">{account.password}</dd>
                  </div>
                </dl>

                <p className="mt-4 text-xs font-medium tracking-wide text-black/50 uppercase">
                  Try this
                </p>
                <ul className="mt-2 space-y-1.5 text-sm text-black/70">
                  {blurb.tour.map((step) => (
                    <li key={step} className="flex gap-2">
                      <span aria-hidden className="text-[color:var(--wpb-red)]">
                        →
                      </span>
                      <span>{step}</span>
                    </li>
                  ))}
                </ul>

                <div className="mt-5 flex-1" />

                {user ? null : (
                  <form action={loginAsDemoAccount}>
                    <input type="hidden" name="role" value={account.role} />
                    <button
                      type="submit"
                      className="wpb-btn w-full rounded-md px-4 py-2.5 text-sm font-semibold transition"
                    >
                      Sign in as {blurb.title.toLowerCase()}
                    </button>
                  </form>
                )}
              </section>
            );
          })}
        </div>

        <p className="mt-6 text-sm text-black/60">
          You can also{" "}
          <Link href="/register" className="text-[color:var(--wpb-red)] hover:underline">
            register your own account
          </Link>{" "}
          — it will last until the next hourly reset.
        </p>
      </div>
    </div>
  );
}
