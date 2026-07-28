import Link from "next/link";

export function AdminContentHeader({
  title,
  crumb,
}: {
  title: string;
  crumb: string;
}) {
  return (
    <div className="mb-4">
      <div className="flex items-end justify-between gap-4">
        <h1 className="text-2xl font-semibold text-[#444]">{title}</h1>
        <div className="text-xs text-zinc-600">
          <Link href="/admin" className="hover:underline">
            Home
          </Link>{" "}
          / <span className="text-zinc-800">{crumb}</span>
        </div>
      </div>
    </div>
  );
}

