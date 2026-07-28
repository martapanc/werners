import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";
import { SESSION_COOKIE, decryptSession } from "@/lib/session-token";

/**
 * Next.js 16 renamed Middleware to Proxy; behaviour is unchanged.
 *
 * This is only an *optimistic* check, as the Next.js auth guide recommends: it
 * bounces obviously-unauthenticated visitors away from /admin without paying
 * for a database round trip. It is not the authorization boundary — the cookie
 * it reads could carry a stale role. `requireAdmin()` in src/lib/dal.ts
 * re-checks against the database on every admin page and action, and that is
 * what actually enforces access.
 */
export async function proxy(request: NextRequest) {
  const token = request.cookies.get(SESSION_COOKIE)?.value;
  const session = await decryptSession(token);

  if (!session) {
    const loginUrl = new URL("/login", request.url);
    loginUrl.searchParams.set("returnTo", request.nextUrl.pathname);
    return NextResponse.redirect(loginUrl);
  }

  if (session.role !== "ADMIN") {
    return NextResponse.redirect(new URL("/?error=admin-only", request.url));
  }

  return NextResponse.next();
}

export const config = {
  matcher: "/admin/:path*",
};
