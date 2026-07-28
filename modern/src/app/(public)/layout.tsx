import { CartProvider } from "@/components/cart-store";
import { DemoBanner } from "@/components/demo-banner";
import { Nav } from "@/components/nav";
import { getCurrentUser } from "@/lib/dal";

export default async function PublicLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const user = await getCurrentUser();

  return (
    <CartProvider>
      <div className="min-h-screen">
        <DemoBanner />
        <Nav user={user} />
        <main>{children}</main>
        <footer className="mt-16 bg-[color:var(--wpb-dark)] text-white">
          <div className="mx-auto grid w-full max-w-5xl gap-10 px-6 py-10 sm:grid-cols-2 lg:grid-cols-4">
            <div>
              <h3 className="text-base font-semibold">About Us</h3>
              <p className="mt-3 text-sm leading-6 text-white/80">
                Portfolio demo inspired by the original uni project (2016–2017).
                This rebuild focuses on preserving the look &amp; feel while
                modernizing the stack.
              </p>
            </div>
            <div>
              <h3 className="text-base font-semibold">Community</h3>
              <ul className="mt-3 space-y-2 text-sm text-white/80">
                <li>Our Team</li>
                <li>Forum</li>
                <li>News &amp; Media</li>
              </ul>
            </div>
            <div>
              <h3 className="text-base font-semibold">Others</h3>
              <ul className="mt-3 space-y-2 text-sm text-white/80">
                <li>Link 1</li>
                <li>Link 2</li>
                <li>Link 3</li>
                <li>Link 4</li>
              </ul>
            </div>
            <div>
              <h3 className="text-base font-semibold">Social Links</h3>
              <div className="mt-3 flex gap-3 text-sm text-white/80">
                <a className="hover:text-white" href="#">
                  Facebook
                </a>
                <a className="hover:text-white" href="#">
                  Twitter
                </a>
                <a className="hover:text-white" href="#">
                  LinkedIn
                </a>
              </div>
            </div>
          </div>
          <div className="border-t border-white/10 py-4 text-center text-xs text-white/70">
            Version 1.0 · Built with Next.js + Prisma
          </div>
        </footer>
      </div>
    </CartProvider>
  );
}

