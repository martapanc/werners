import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Werner's Panini & Burgers (Modern)",
  description: "A modernized portfolio version of the uni project.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="h-full antialiased">
      <body className="min-h-full bg-[var(--wpb-light)] text-[color:var(--foreground)]">
        {children}
      </body>
    </html>
  );
}
