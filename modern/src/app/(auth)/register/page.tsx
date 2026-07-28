import Link from "next/link";
import { redirect } from "next/navigation";
import { register } from "../actions";
import { AuthForm, Field } from "@/components/auth/auth-form";
import { getCurrentUser } from "@/lib/dal";

export const metadata = { title: "Register · Werner's Panini & Burgers" };

export default async function RegisterPage() {
  if (await getCurrentUser()) redirect("/");

  return (
    <div className="rounded-lg border border-black/10 bg-white p-6 shadow-sm">
      <h1 className="text-xl font-semibold tracking-tight">Create an account</h1>
      <p className="mt-1 mb-5 text-sm text-black/60">
        Already registered?{" "}
        <Link href="/login" className="text-[color:var(--wpb-red)] hover:underline">
          Sign in
        </Link>
        .
      </p>

      <AuthForm action={register} submitLabel="Register">
        <Field label="Full name" name="fullName" autoComplete="name" />
        <Field label="Email" name="email" type="email" autoComplete="email" />
        <Field
          label="Password"
          name="password"
          type="password"
          autoComplete="new-password"
        />
        <Field
          label="Confirm password"
          name="confirmPassword"
          type="password"
          autoComplete="new-password"
        />
      </AuthForm>

      <p className="mt-4 text-xs text-black/50">
        Heads up: this is a demo. All data is wiped and re-seeded every hour, so
        accounts you create here are temporary.
      </p>
    </div>
  );
}
