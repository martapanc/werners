import Link from "next/link";
import { redirect } from "next/navigation";
import { login } from "../actions";
import { AuthForm, Field } from "@/components/auth/auth-form";
import { getCurrentUser } from "@/lib/dal";

export const metadata = { title: "Sign in · Werner's Panini & Burgers" };

export default async function LoginPage({
  searchParams,
}: {
  searchParams: Promise<{ returnTo?: string }>;
}) {
  if (await getCurrentUser()) redirect("/");

  const { returnTo } = await searchParams;

  return (
    <div className="rounded-lg border border-black/10 bg-white p-6 shadow-sm">
      <h1 className="text-xl font-semibold tracking-tight">Sign in</h1>
      <p className="mt-1 mb-5 text-sm text-black/60">
        Don&apos;t have an account?{" "}
        <Link href="/register" className="text-[color:var(--wpb-red)] hover:underline">
          Register
        </Link>
        , or grab the{" "}
        <Link href="/demo" className="text-[color:var(--wpb-red)] hover:underline">
          demo credentials
        </Link>
        .
      </p>

      <AuthForm action={login} submitLabel="Sign in" returnTo={returnTo}>
        <Field label="Email" name="email" type="email" autoComplete="email" />
        <Field
          label="Password"
          name="password"
          type="password"
          autoComplete="current-password"
        />
      </AuthForm>
    </div>
  );
}
