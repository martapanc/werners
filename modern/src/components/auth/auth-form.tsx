"use client";

import { useActionState } from "react";
import { useFormStatus } from "react-dom";
import type { AuthState } from "@/app/(auth)/actions";

type AuthAction = (
  state: AuthState,
  formData: FormData
) => Promise<AuthState>;

function SubmitButton({ label }: { label: string }) {
  const { pending } = useFormStatus();
  return (
    <button
      type="submit"
      disabled={pending}
      className="wpb-btn w-full rounded-md px-4 py-2.5 text-sm font-semibold transition disabled:cursor-not-allowed disabled:opacity-60"
    >
      {pending ? "Please wait…" : label}
    </button>
  );
}

export function AuthForm({
  action,
  submitLabel,
  returnTo,
  children,
}: {
  action: AuthAction;
  submitLabel: string;
  returnTo?: string;
  children: React.ReactNode;
}) {
  const [state, formAction] = useActionState<AuthState, FormData>(
    action,
    undefined
  );

  return (
    <form action={formAction} className="space-y-4">
      {returnTo ? <input type="hidden" name="returnTo" value={returnTo} /> : null}

      {state?.error ? (
        <p
          role="alert"
          className="rounded-md border border-[color:var(--wpb-red)]/30 bg-[color:var(--wpb-red)]/10 px-3 py-2 text-sm text-[color:var(--wpb-red-dark)]"
        >
          {state.error}
        </p>
      ) : null}

      {children}

      <SubmitButton label={submitLabel} />
    </form>
  );
}

export function Field({
  label,
  name,
  type = "text",
  autoComplete,
  defaultValue,
  required = true,
}: {
  label: string;
  name: string;
  type?: string;
  autoComplete?: string;
  defaultValue?: string;
  required?: boolean;
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-sm font-medium text-black/70">
        {label}
      </span>
      <input
        name={name}
        type={type}
        required={required}
        autoComplete={autoComplete}
        defaultValue={defaultValue}
        className="w-full rounded-md border border-black/15 bg-white px-3 py-2 text-sm text-[#2f2f2f] outline-none focus:border-[color:var(--wpb-red)] focus:ring-2 focus:ring-[color:var(--wpb-red)]/20"
      />
    </label>
  );
}
