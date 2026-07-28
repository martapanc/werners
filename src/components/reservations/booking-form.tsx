"use client";

import { useActionState } from "react";
import { useFormStatus } from "react-dom";
import { createReservation, type FormState } from "@/app/actions";

/**
 * Split out of the page so the booking outcome can be shown inline.
 *
 * Rejections here are normal — a double-booked slot, a table too small for the
 * party — and the page is a Server Component, which cannot hold the returned
 * error state. Hence a client island around just the form.
 */

type TableOption = {
  id: number;
  name: string;
  seats: number;
  room: string | null;
};

function ReserveButton() {
  const { pending } = useFormStatus();
  return (
    <button
      disabled={pending}
      className="wpb-btn mt-2 w-full rounded-md px-5 py-3 text-sm font-medium disabled:cursor-not-allowed disabled:opacity-60"
    >
      {pending ? "Checking availability…" : "Reserve"}
    </button>
  );
}

export function BookingForm({
  tables,
  defaultStartValue,
}: {
  tables: TableOption[];
  defaultStartValue: string;
}) {
  const [state, formAction] = useActionState<FormState, FormData>(
    createReservation,
    undefined
  );

  return (
    <>
      {state?.error ? (
        <p
          role="alert"
          className="mt-4 rounded-md border border-[color:var(--wpb-red)]/30 bg-[color:var(--wpb-red)]/10 px-3 py-3 text-sm text-[color:var(--wpb-red-dark)]"
        >
          {state.error}
        </p>
      ) : null}

      <form action={formAction} className="mt-4 space-y-4">
        <label className="block">
          <div className="text-sm text-zinc-600">Name</div>
          <input
            name="customerName"
            required
            className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
            placeholder="Giulia"
          />
        </label>

        <div className="grid gap-4 sm:grid-cols-2">
          <label className="block">
            <div className="text-sm text-zinc-600">Party size</div>
            <input
              name="partySize"
              type="number"
              min={1}
              max={12}
              defaultValue={2}
              required
              className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
            />
          </label>
          <label className="block">
            <div className="text-sm text-zinc-600">Duration (minutes)</div>
            <input
              name="durationMinutes"
              type="number"
              min={30}
              max={240}
              defaultValue={90}
              required
              className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
            />
          </label>
        </div>

        <label className="block">
          <div className="text-sm text-zinc-600">Start time</div>
          <input
            name="startDate"
            type="datetime-local"
            required
            defaultValue={defaultStartValue}
            className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
          />
        </label>

        <label className="block">
          <div className="text-sm text-zinc-600">Table</div>
          <select
            name="roomTableId"
            required
            className="mt-1 w-full rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
          >
            {tables.map((t) => (
              <option key={t.id} value={t.id}>
                {t.name} · {t.seats} seats · {t.room ?? "Main room"}
              </option>
            ))}
          </select>
        </label>

        <label className="block">
          <div className="text-sm text-zinc-600">Comment (optional)</div>
          <textarea
            name="comment"
            rows={3}
            className="mt-1 w-full resize-none rounded-md border border-black/10 bg-white px-4 py-3 text-sm"
            placeholder="Birthday, near the window..."
          />
        </label>

        <ReserveButton />
      </form>
    </>
  );
}
