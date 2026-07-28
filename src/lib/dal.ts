import "server-only";

import { cache } from "react";
import { redirect } from "next/navigation";
import { prisma } from "@/lib/prisma";
import { readSession } from "@/lib/session";

/**
 * The authorization boundary. Pages and server actions call these helpers
 * rather than trusting the session cookie directly.
 *
 * The cookie's `role` claim is only a hint used by `proxy.ts` for cheap
 * redirects — it is signed, but it was minted when the user logged in and could
 * be stale (an admin demoted mid-session, or a user deleted by the hourly
 * reset). Everything here re-reads the user from the database, so an out-of-date
 * claim can never grant access on its own.
 */

export type CurrentUser = {
  id: number;
  email: string;
  fullName: string;
  role: "CUSTOMER" | "ADMIN";
};

/** Deduped per request, so several components can ask without extra queries. */
export const getCurrentUser = cache(async (): Promise<CurrentUser | null> => {
  const session = await readSession();
  if (!session) return null;

  const user = await prisma.user.findUnique({
    where: { id: session.userId },
    select: { id: true, email: true, fullName: true, role: true },
  });

  return user ?? null;
});

/** Redirects to the login page when signed out. */
export async function requireUser(returnTo?: string): Promise<CurrentUser> {
  const user = await getCurrentUser();
  if (!user) {
    redirect(loginUrl(returnTo));
  }
  return user;
}

/** Redirects signed-out users to login, and signed-in non-admins to the home page. */
export async function requireAdmin(returnTo?: string): Promise<CurrentUser> {
  const user = await getCurrentUser();
  if (!user) {
    redirect(loginUrl(returnTo));
  }
  if (user.role !== "ADMIN") {
    redirect("/?error=admin-only");
  }
  return user;
}

function loginUrl(returnTo?: string) {
  return returnTo
    ? `/login?returnTo=${encodeURIComponent(returnTo)}`
    : "/login";
}
