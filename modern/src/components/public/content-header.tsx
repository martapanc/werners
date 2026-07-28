import Link from "next/link";

export function PublicContentHeader({
  title,
  crumb,
}: {
  title: string;
  crumb: string;
}) {
  return (
    <section className="mb-6">
      <div className="flex items-end justify-between gap-4">
        <h1 className="text-3xl font-semibold tracking-tight text-[#444]">
          {title} <small className="text-base font-normal text-zinc-500"></small>
        </h1>
        <ol className="text-xs text-zinc-600">
          <li className="inline">
            <Link href="/" className="hover:underline">
              Home
            </Link>
          </li>
          <li className="inline">{" / "}</li>
          <li className="inline text-zinc-800">{crumb}</li>
        </ol>
      </div>
    </section>
  );
}

