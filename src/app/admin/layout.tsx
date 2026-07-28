import Link from "next/link";
import { AdminSidebar } from "@/components/admin/sidebar";
import { logout } from "@/app/(auth)/actions";
import { requireAdmin } from "@/lib/dal";

export default async function AdminLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  // Enforced here rather than in proxy.ts: this re-reads the role from the
  // database, so a stale cookie can't get in. Guards every page in the segment.
  const admin = await requireAdmin("/admin");

  return (
    <div className="min-h-screen bg-[#ecf0f5]">
      <header className="sticky top-0 z-20 h-12 border-b border-black/10 bg-[color:var(--wpb-red)] text-white">
        <div className="mx-auto flex h-12 max-w-7xl items-center">
          <div className="flex h-12 w-56 items-center justify-center bg-[color:var(--wpb-red-dark)] font-semibold tracking-tight">
            WPB
          </div>
          <div className="flex flex-1 items-center justify-between px-4 text-sm">
            <div className="font-medium">Admin Panel</div>
            <div className="flex items-center gap-4">
              <span className="opacity-90">{admin.fullName}</span>
              <Link href="/" className="hover:underline">
                Back to site
              </Link>
              <form action={logout}>
                <button type="submit" className="hover:underline">
                  Sign out
                </button>
              </form>
            </div>
          </div>
        </div>
      </header>

      <div className="mx-auto flex w-full max-w-7xl">
        <AdminSidebar />
        <div className="min-w-0 flex-1 px-4 py-6">{children}</div>
      </div>
    </div>
  );
}

