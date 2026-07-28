import { SignJWT, jwtVerify } from "jose";

/**
 * Pure sign/verify helpers, deliberately free of `next/headers` and
 * `server-only` imports so `proxy.ts` can use them too — proxy runs before the
 * request reaches a route and has no access to the `cookies()` store.
 */

export const SESSION_COOKIE = "wpb_session";

export type SessionPayload = {
  userId: number;
  role: "CUSTOMER" | "ADMIN";
};

function secretKey() {
  const secret = process.env.SESSION_SECRET;
  if (!secret) {
    throw new Error("Missing env var: SESSION_SECRET");
  }
  return new TextEncoder().encode(secret);
}

export async function encryptSession(payload: SessionPayload) {
  return new SignJWT({ ...payload })
    .setProtectedHeader({ alg: "HS256" })
    .setIssuedAt()
    .setExpirationTime("7d")
    .sign(secretKey());
}

export async function decryptSession(
  token: string | undefined
): Promise<SessionPayload | null> {
  if (!token) return null;
  try {
    const { payload } = await jwtVerify(token, secretKey(), {
      algorithms: ["HS256"],
    });
    if (typeof payload.userId !== "number") return null;
    if (payload.role !== "CUSTOMER" && payload.role !== "ADMIN") return null;
    return { userId: payload.userId, role: payload.role };
  } catch {
    // Expired, tampered with, or signed by an older SESSION_SECRET.
    return null;
  }
}
