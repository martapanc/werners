import Image from "next/image";
import Link from "next/link";

export default function AuthLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="flex min-h-screen flex-col bg-[var(--wpb-light)]">
      <header className="border-b border-black/10 bg-[var(--wpb-red)] text-white">
        <div className="mx-auto flex max-w-5xl items-center justify-between px-6 py-3">
          <Link href="/" className="flex items-center gap-3">
            <Image
              src="/legacy/img/burger-160x160.jpg"
              alt="WPB"
              width={40}
              height={40}
              className="h-10 w-10 rounded-full border border-white/30 object-cover"
            />
            <span className="text-base font-semibold tracking-tight">
              Werner&apos;s{" "}
              <span className="text-sm font-medium opacity-90">
                Panini&amp;Burgers
              </span>
            </span>
          </Link>
          <Link href="/demo" className="text-sm hover:underline">
            Demo accounts
          </Link>
        </div>
      </header>

      <main className="mx-auto flex w-full max-w-md flex-1 flex-col justify-center px-6 py-12">
        {children}
      </main>
    </div>
  );
}
