"use client";

import { useState } from "react";
import Image from "next/image";
import { setItemImage } from "@/app/admin/actions";
import type { FoodImage } from "@/lib/food-images";

/**
 * Picks an item's photo from the bundled gallery.
 *
 * Each choice is its own tiny form posting to `setItemImage`, so the whole thing
 * works without client-side state beyond "is the drawer open" — and still works
 * if JavaScript never loads.
 */
export function ItemImagePicker({
  itemId,
  itemName,
  current,
  gallery,
}: {
  itemId: number;
  itemName: string;
  current: string | null;
  gallery: FoodImage[];
}) {
  const [open, setOpen] = useState(false);

  return (
    <div className="flex items-start gap-3">
      <div className="relative h-14 w-20 shrink-0 overflow-hidden rounded-sm border border-black/10 bg-zinc-100">
        {current ? (
          <Image src={current} alt="" fill sizes="80px" className="object-cover" />
        ) : (
          <span className="flex h-full w-full items-center justify-center text-[10px] text-zinc-500">
            No image
          </span>
        )}
      </div>

      <div>
        <button
          type="button"
          onClick={() => setOpen((v) => !v)}
          aria-expanded={open}
          className="cursor-pointer rounded-sm border border-black/10 bg-white px-3 py-2 text-sm font-medium hover:bg-black/5"
        >
          {open ? "Close" : current ? "Change image" : "Set image"}
        </button>

        {open ? (
          <div className="mt-3 w-[min(34rem,80vw)] rounded-sm border border-black/10 bg-white p-3 shadow-sm">
            <div className="mb-2 flex items-center justify-between">
              <p className="text-xs font-medium text-zinc-600">
                Choose a photo for {itemName}
              </p>
              {current ? (
                <form action={setItemImage}>
                  <input type="hidden" name="itemId" value={itemId} />
                  <input type="hidden" name="image" value="" />
                  <button
                    type="submit"
                    className="cursor-pointer text-xs text-[color:var(--wpb-red)] hover:underline"
                  >
                    Remove image
                  </button>
                </form>
              ) : null}
            </div>

            <div className="grid max-h-72 grid-cols-4 gap-2 overflow-y-auto sm:grid-cols-5">
              {gallery.map((image) => {
                const selected = image.src === current;
                return (
                  <form key={image.src} action={setItemImage}>
                    <input type="hidden" name="itemId" value={itemId} />
                    <input type="hidden" name="image" value={image.src} />
                    <button
                      type="submit"
                      title={`${image.label} (${image.category})`}
                      aria-label={`Use ${image.label}`}
                      aria-current={selected}
                      className={[
                        "relative block aspect-[4/3] w-full cursor-pointer overflow-hidden rounded-sm border-2 transition",
                        selected
                          ? "border-[color:var(--wpb-red)]"
                          : "border-transparent hover:border-black/20",
                      ].join(" ")}
                    >
                      <Image
                        src={image.src}
                        alt=""
                        fill
                        sizes="120px"
                        className="object-cover"
                      />
                    </button>
                  </form>
                );
              })}
            </div>
          </div>
        ) : null}
      </div>
    </div>
  );
}
