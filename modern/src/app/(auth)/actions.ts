"use server";

import bcrypt from "bcryptjs";
import { z } from "zod";
import { redirect } from "next/navigation";
import { prisma } from "@/lib/prisma";
import { createSession, deleteSession } from "@/lib/session";
import { DEMO_ACCOUNTS } from "@/lib/demo-data";

export type AuthState = { error?: string } | undefined;

/**
 * `returnTo` arrives from the query string, so it is attacker-controlled.
 * Only same-site absolute paths are allowed — `//evil.com` and
 * `https://evil.com` are both rejected, otherwise login would be an open
 * redirect.
 */
function safeReturnTo(value: FormDataEntryValue | null): string {
  if (typeof value !== "string") return "/";
  if (!value.startsWith("/") || value.startsWith("//")) return "/";
  return value;
}

const loginSchema = z.object({
  email: z.string().trim().toLowerCase().email(),
  password: z.string().min(1),
});

export async function login(
  _state: AuthState,
  formData: FormData
): Promise<AuthState> {
  const parsed = loginSchema.safeParse({
    email: formData.get("email"),
    password: formData.get("password"),
  });
  if (!parsed.success) {
    return { error: "Enter a valid email and password." };
  }

  const user = await prisma.user.findUnique({
    where: { email: parsed.data.email },
    select: { id: true, passwordHash: true, role: true },
  });

  // Same message whether the email is unknown or the password is wrong, so the
  // form can't be used to enumerate registered accounts.
  const invalid = { error: "Invalid email or password." };
  if (!user) {
    // Burn a comparable amount of time so a missing user isn't detectably faster.
    await bcrypt.compare(parsed.data.password, PLACEHOLDER_HASH);
    return invalid;
  }

  const matches = await bcrypt.compare(parsed.data.password, user.passwordHash);
  if (!matches) return invalid;

  await createSession({ userId: user.id, role: user.role });
  redirect(safeReturnTo(formData.get("returnTo")));
}

/** A bcrypt hash of a random string — only used to equalise timing above. */
const PLACEHOLDER_HASH =
  "$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy";

const registerSchema = z
  .object({
    fullName: z.string().trim().min(2).max(80),
    email: z.string().trim().toLowerCase().email(),
    password: z.string().min(8).max(72),
    confirmPassword: z.string(),
  })
  .refine((data) => data.password === data.confirmPassword, {
    message: "Passwords do not match.",
    path: ["confirmPassword"],
  });

export async function register(
  _state: AuthState,
  formData: FormData
): Promise<AuthState> {
  const parsed = registerSchema.safeParse({
    fullName: formData.get("fullName"),
    email: formData.get("email"),
    password: formData.get("password"),
    confirmPassword: formData.get("confirmPassword"),
  });
  if (!parsed.success) {
    return {
      error:
        parsed.error.issues[0]?.message ??
        "Check the form and try again (password must be at least 8 characters).",
    };
  }

  const existing = await prisma.user.findUnique({
    where: { email: parsed.data.email },
    select: { id: true },
  });
  if (existing) {
    return { error: "That email is already registered." };
  }

  const user = await prisma.user.create({
    data: {
      email: parsed.data.email,
      fullName: parsed.data.fullName,
      passwordHash: await bcrypt.hash(parsed.data.password, 10),
      role: "CUSTOMER",
    },
    select: { id: true, role: true },
  });

  await createSession({ userId: user.id, role: user.role });
  redirect("/");
}

/**
 * One-click sign-in for the /demo page.
 *
 * This is deliberately not a privileged bypass: it looks up the same public
 * credentials shown on that page and runs them through the ordinary password
 * check, so it grants nothing a visitor couldn't get by typing them in.
 */
export async function loginAsDemoAccount(formData: FormData) {
  const role = formData.get("role");
  const account = DEMO_ACCOUNTS.find((a) => a.role === role);
  if (!account) throw new Error("Unknown demo account");

  const user = await prisma.user.findUnique({
    where: { email: account.email },
    select: { id: true, passwordHash: true, role: true },
  });
  if (!user) throw new Error("Demo account is not seeded");

  const matches = await bcrypt.compare(account.password, user.passwordHash);
  if (!matches) throw new Error("Demo account credentials are out of date");

  await createSession({ userId: user.id, role: user.role });
  redirect(account.role === "ADMIN" ? "/admin" : "/menu");
}

export async function logout() {
  await deleteSession();
  redirect("/");
}
