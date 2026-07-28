"use client";

import { useEffect, useMemo, useState } from "react";
import Link from "next/link";
import Image from "next/image";

type Slide = {
  src: string;
  title: string;
  body: string;
  ctaHref: string;
  ctaLabel: string;
};

export function HeroSlider() {
  const slides: Slide[] = useMemo(
    () => [
      {
        src: "/legacy/slider/fast-food.jpg",
        title: "Taste the quality",
        body: "A modern rebuild of the original uni project — menu, orders and reservations.",
        ctaHref: "/menu",
        ctaLabel: "Take-away Order",
      },
      {
        src: "/legacy/slider/restaurant-2.jpg",
        title: "Largest & beautiful environment",
        body: "Book a table in seconds with server-side conflict checks.",
        ctaHref: "/reservations",
        ctaLabel: "Table Reservation",
      },
      {
        src: "/legacy/slider/photo1.png",
        title: "Built for a portfolio",
        body: "Next.js App Router + Prisma 7, styled to match the original look & feel.",
        ctaHref: "/menu",
        ctaLabel: "Browse Menu",
      },
    ],
    []
  );

  const [index, setIndex] = useState(0);

  useEffect(() => {
    const id = window.setInterval(() => {
      setIndex((i) => (i + 1) % slides.length);
    }, 4500);
    return () => window.clearInterval(id);
  }, [slides.length]);

  const slide = slides[index] ?? slides[0];

  return (
    <section className="relative overflow-hidden bg-[#ccc]">
      <div className="absolute inset-0">
        <Image
          src={slide.src}
          alt=""
          fill
          priority
          sizes="100vw"
          className="object-cover"
        />
      </div>

      <div className="relative mx-auto w-full max-w-5xl px-6">
        <div className="max-w-xl py-24 text-white">
          <h1 className="inline-block bg-[rgba(49,59,61,0.6)] p-2 text-3xl font-semibold uppercase tracking-tight sm:text-4xl">
            {slide.title}
          </h1>
          <p className="mt-2 bg-[rgba(49,59,61,0.6)] p-3 text-sm font-semibold leading-6">
            {slide.body}
          </p>

          <div className="mt-8 flex flex-col gap-3 sm:flex-row">
            <Link
              href={slide.ctaHref}
              className="inline-flex items-center justify-center rounded-md border-2 border-white bg-[rgba(49,59,61,0.6)] px-5 py-3 text-sm font-medium text-white hover:bg-[rgba(49,59,61,0.75)]"
            >
              {slide.ctaLabel}
            </Link>
            <button
              type="button"
              onClick={() => setIndex((i) => (i + 1) % slides.length)}
              className="inline-flex items-center justify-center rounded-md border-2 border-white bg-[rgba(49,59,61,0.6)] px-5 py-3 text-sm font-medium text-white hover:bg-[rgba(49,59,61,0.75)]"
            >
              Next slide
            </button>
          </div>

          <div className="mt-8 flex items-center gap-2">
            {slides.map((_, i) => (
              <button
                key={i}
                type="button"
                aria-label={`Go to slide ${i + 1}`}
                onClick={() => setIndex(i)}
                className={[
                  "h-2.5 w-2.5 rounded-full border border-white/50",
                  i === index ? "bg-white" : "bg-transparent",
                ].join(" ")}
              />
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
