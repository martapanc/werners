import Link from "next/link";
import Image from "next/image";

function SidebarLink({
  href,
  label,
}: {
  href: string;
  label: string;
}) {
  return (
    <Link
      href={href}
      className="block border-l-4 border-transparent px-4 py-3 text-sm text-white/80 hover:border-[color:var(--wpb-red)] hover:bg-[#1e282c] hover:text-white"
    >
      {label}
    </Link>
  );
}

export function AdminSidebar() {
  return (
    <aside className="w-56 shrink-0 bg-[color:var(--wpb-dark)]">
      <div className="flex items-center gap-3 border-b border-white/10 px-4 py-4">
        <Image
          src="/legacy/img/gusteau160x160.jpg"
          alt="Admin"
          width={40}
          height={40}
          className="h-10 w-10 rounded-full border border-white/20 object-cover"
        />
        <div className="min-w-0">
          <div className="truncate text-sm font-semibold text-white">
            Admin
          </div>
          <div className="text-xs text-white/60">Online</div>
        </div>
      </div>
      <div className="border-b border-white/10 px-4 py-4">
        <div className="text-xs font-semibold uppercase tracking-wide text-white/70">
          Navigation
        </div>
      </div>
      <nav className="py-2">
        <SidebarLink href="/admin" label="Dashboard" />
        <SidebarLink href="/admin/orders" label="Takeaway Orders" />
        <SidebarLink href="/admin/reservations" label="Reservations" />
        <SidebarLink href="/admin/menu" label="Menu Management" />
      </nav>
    </aside>
  );
}
