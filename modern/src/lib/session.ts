import "server-only";

import { cookies } from "next/headers";
import {
  SESSION_COOKIE,
  decryptSession,
  encryptSession,
  type SessionPayload,
} from "@/lib/session-token";

/**
 * Stateless sessions: a signed JWT in an httpOnly cookie.
 *
 * The original Java app kept a `UserSession` row in the database. That would
 * not survive this demo's hourly reset — every visitor would be logged out
 * whenever the cron fired. Signing the session instead keeps it valid across a
 * reset, because the demo users are re-seeded with the same fixed IDs.
 */

const SESSION_DURATION_MS = 7 * 24 * 60 * 60 * 1000;

export type { SessionPayload };
export { SESSION_COOKIE };

export async function createSession(payload: SessionPayload) {
  const expiresAt = new Date(Date.now() + SESSION_DURATION_MS);
  const cookieStore = await cookies();

  cookieStore.set(SESSION_COOKIE, await encryptSession(payload), {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    expires: expiresAt,
    sameSite: "lax",
    path: "/",
  });
}

export async function deleteSession() {
  const cookieStore = await cookies();
  cookieStore.delete(SESSION_COOKIE);
}

export async function readSession(): Promise<SessionPayload | null> {
  const cookieStore = await cookies();
  return decryptSession(cookieStore.get(SESSION_COOKIE)?.value);
}
