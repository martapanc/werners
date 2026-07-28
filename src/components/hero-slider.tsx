"use client";

import { useCallback, useEffect, useState } from "react";
import Link from "next/link";
import Image from "next/image";

type Slide = {
  src: string;
  eyebrow: string;
  title: string;
  body: string;
  ctaHref: string;
  ctaLabel: string;
  /** Secondary CTA is per-slide so it never repeats the primary one. */
  altHref: string;
  altLabel: string;
};

/**
 * The slides are static, so they live outside the component — no need to
 * re-create the array (or memoize it) on every render.
 */
const SLIDES: Slide[] = [
  {
    src: "/legacy/slider/fast-food.jpg",
    eyebrow: "Take-away",
    title: "Taste the quality",
    body: "Browse the full menu, build your order and check out in a couple of clicks.",
    ctaHref: "/menu",
    ctaLabel: "Order take-away",
    altHref: "/reservations",
    altLabel: "Book a table",
  },
  {
    src: "/legacy/slider/restaurant-2.jpg",
    eyebrow: "Reservations",
    title: "A table waiting for you",
    body: "Pick a room, a time and a party size — availability is checked as you book.",
    ctaHref: "/reservations",
    ctaLabel: "Book a table",
    altHref: "/menu",
    altLabel: "See the menu",
  },
  {
    src: "/legacy/slider/photo1.png",
    eyebrow: "About this build",
    title: "A 2016 project, rebuilt",
    body: "The original Java and JSP app, remade with Next.js, Prisma and Postgres.",
    ctaHref: "/demo",
    ctaLabel: "See the demo accounts",
    altHref: "/menu",
    altLabel: "See the menu",
  },
];

const SLIDE_DURATION_MS = 6000;

export function HeroSlider() {
  const [index, setIndex] = useState(0);
  const [isPaused, setIsPaused] = useState(false);
  const [reduceMotion, setReduceMotion] = useState(false);

  // Autoplay and the Ken Burns drift are decorative, so they're switched off
  // for anyone who asked the OS to reduce motion.
  useEffect(() => {
    const query = window.matchMedia("(prefers-reduced-motion: reduce)");
    const sync = () => setReduceMotion(query.matches);
    sync();
    query.addEventListener("change", sync);
    return () => query.removeEventListener("change", sync);
  }, []);

  const go = useCallback((next: number) => {
    setIndex(((next % SLIDES.length) + SLIDES.length) % SLIDES.length);
  }, []);

  useEffect(() => {
    if (isPaused || reduceMotion) return;
    const id = window.setTimeout(
      () => setIndex((i) => (i + 1) % SLIDES.length),
      SLIDE_DURATION_MS
    );
    return () => window.clearTimeout(id);
  }, [index, isPaused, reduceMotion]);

  function onKeyDown(event: React.KeyboardEvent) {
    if (event.key === "ArrowRight") {
      event.preventDefault();
      go(index + 1);
    } else if (event.key === "ArrowLeft") {
      event.preventDefault();
      go(index - 1);
    }
  }

  const slide = SLIDES[index];

  return (
    <section
      aria-roledescription="carousel"
      aria-label="Featured"
      tabIndex={-1}
      onKeyDown={onKeyDown}
      onMouseEnter={() => setIsPaused(true)}
      onMouseLeave={() => setIsPaused(false)}
      onFocusCapture={() => setIsPaused(true)}
      onBlurCapture={() => setIsPaused(false)}
      /* A fixed, viewport-relative height is what keeps the hero from jumping:
         the images are absolutely positioned and the copy varies in length, so
         without this the section would be sized by whichever slide is showing.
         svh rather than vh so mobile browser chrome doesn't resize it. */
      className="relative isolate h-[70svh] max-h-[760px] min-h-[440px] w-full overflow-hidden bg-[var(--wpb-dark)]"
    >
      {/* Every slide stays mounted and crossfades. Swapping the `src` of a
          single <Image> instead would flash while the new file decodes. */}
      {SLIDES.map((s, i) => (
        <div
          key={s.src}
          aria-hidden={i !== index}
          className={[
            "absolute inset-0 transition-opacity duration-[900ms] ease-out motion-reduce:transition-none",
            i === index ? "opacity-100" : "opacity-0",
          ].join(" ")}
        >
          <Image
            src={s.src}
            alt=""
            fill
            sizes="100vw"
            priority={i === 0}
            loading={i === 0 ? undefined : "eager"}
            className={[
              "object-cover",
              i === index ? "wpb-kenburns" : "",
            ].join(" ")}
          />
        </div>
      ))}

      {/* Scrim: weighted to the left, where the copy sits, so the right half of
          the photo stays visible. Replaces the original's opaque boxes behind
          each line of text. The slide images vary a lot in brightness, so this
          has to carry enough contrast for the lightest of them. */}
      <div className="absolute inset-0 bg-gradient-to-r from-black/75 via-black/40 to-transparent" />
      <div className="absolute inset-x-0 bottom-0 h-32 bg-gradient-to-t from-black/45 to-transparent" />

      <div className="relative flex h-full flex-col justify-center">
        <div className="mx-auto w-full max-w-5xl px-6">
          {/* Keyed on index so the copy re-animates as the slide changes. */}
          <div key={index} className="wpb-slide-in max-w-xl text-white">
            <p className="text-xs font-semibold tracking-[0.2em] text-white/70 uppercase">
              {slide.eyebrow}
            </p>
            <h1 className="mt-3 text-4xl font-semibold tracking-tight text-balance sm:text-5xl lg:text-6xl">
              {slide.title}
            </h1>
            <p className="mt-4 max-w-md text-base leading-7 text-pretty text-white/85">
              {slide.body}
            </p>

            <div className="mt-8 flex flex-col gap-3 sm:flex-row">
              <Link
                href={slide.ctaHref}
                className="wpb-btn inline-flex items-center justify-center rounded-full px-6 py-3 text-sm font-semibold shadow-lg shadow-black/20 transition hover:-translate-y-0.5"
              >
                {slide.ctaLabel}
              </Link>
              <Link
                href={slide.altHref}
                className="inline-flex items-center justify-center rounded-full border border-white/30 bg-white/10 px-6 py-3 text-sm font-semibold text-white backdrop-blur-sm transition hover:bg-white/20"
              >
                {slide.altLabel}
              </Link>
            </div>
          </div>
        </div>
      </div>

      {/* Live region: announces slide changes without moving focus. */}
      <p aria-live="polite" className="sr-only">
        Slide {index + 1} of {SLIDES.length}: {slide.title}
      </p>

      <div className="absolute inset-x-0 bottom-0">
        <div className="mx-auto flex w-full max-w-5xl items-center justify-between gap-4 px-6 pb-8">
          {/* Each dot doubles as a progress bar for the active slide. */}
          <div className="flex items-center gap-2.5">
            {SLIDES.map((s, i) => (
              <button
                key={s.src}
                type="button"
                onClick={() => go(i)}
                aria-label={`Show slide ${i + 1}: ${s.title}`}
                aria-current={i === index}
                className="group relative h-1.5 cursor-pointer overflow-hidden rounded-full bg-white/30 transition-all hover:bg-white/50"
                style={{ width: i === index ? 56 : 24 }}
              >
                {i === index ? (
                  <span
                    key={`${index}-${isPaused}-${reduceMotion}`}
                    className="absolute inset-y-0 left-0 block rounded-full bg-white"
                    style={
                      reduceMotion || isPaused
                        ? { width: "100%" }
                        : {
                            animation: `wpb-progress ${SLIDE_DURATION_MS}ms linear forwards`,
                          }
                    }
                  />
                ) : null}
              </button>
            ))}
          </div>

          <div className="flex items-center gap-2">
            <SliderButton label="Previous slide" onClick={() => go(index - 1)}>
              <path d="M15 18l-6-6 6-6" />
            </SliderButton>
            <SliderButton label="Next slide" onClick={() => go(index + 1)}>
              <path d="M9 18l6-6-6-6" />
            </SliderButton>
          </div>
        </div>
      </div>
    </section>
  );
}

function SliderButton({
  label,
  onClick,
  children,
}: {
  label: string;
  onClick: () => void;
  children: React.ReactNode;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      aria-label={label}
      className="inline-flex h-10 w-10 cursor-pointer items-center justify-center rounded-full border border-white/25 bg-white/10 text-white backdrop-blur-sm transition hover:bg-white/25 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-white"
    >
      <svg
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        strokeWidth={2}
        strokeLinecap="round"
        strokeLinejoin="round"
        className="h-4 w-4"
        aria-hidden
      >
        {children}
      </svg>
    </button>
  );
}
