/**
 * The bundled food-photo gallery.
 *
 * Deliberately not marked `server-only`: the seed script imports it from plain
 * Node, and it holds nothing sensitive — just paths to files already public.
 *
 * Images live in `public/food/` and are committed to the repo, so the menu looks
 * complete the moment the demo is seeded and keeps working after every hourly
 * reset — no upload storage, no API keys, nothing to expire. Every file is CC0
 * or public domain (provenance in `public/food/CREDITS.md`).
 *
 * This list is also the allow-list: `setItemImage` refuses any path that is not
 * in it, so the admin form cannot be used to point `Item.image` at an arbitrary
 * URL.
 */

export type FoodImage = {
  src: string;
  label: string;
  /** Matches a FoodClass name, used to surface the most relevant photos first. */
  category: string;
};

export const FOOD_IMAGES: FoodImage[] = [
  // Pizza
  { src: "/food/pizza-margherita.jpg", label: "Margherita", category: "Pizza" },
  { src: "/food/pizza-pepperoni.jpg", label: "Diavola", category: "Pizza" },
  { src: "/food/pizza-quattro-stagioni.jpg", label: "Quattro stagioni", category: "Pizza" },
  { src: "/food/pizza-ham-mushroom.jpg", label: "Capricciosa", category: "Pizza" },
  { src: "/food/pizza-quattro-formaggi.jpg", label: "Quattro formaggi", category: "Pizza" },
  { src: "/food/pizza-vegetariana.jpg", label: "Vegetariana", category: "Pizza" },

  // Burger
  { src: "/food/chicken-burger.jpg", label: "Chicken burger", category: "Burger" },
  { src: "/food/double-cheese-burger.jpg", label: "Double cheeseburger", category: "Burger" },
  { src: "/food/pastrami-burger.jpg", label: "Pastrami burger", category: "Burger" },
  { src: "/food/veggie-burger.jpg", label: "Veggie burger", category: "Burger" },
  { src: "/food/hotdog.jpg", label: "Hot dog", category: "Burger" },
  { src: "/food/ham-cheese-toast.jpg", label: "Ham and cheese toast", category: "Burger" },

  // Salad
  { src: "/food/salad-mixed.jpg", label: "Mixed salad", category: "Salad" },
  { src: "/food/salad-tomato-cucumber.jpg", label: "Tomato and cucumber", category: "Salad" },
  { src: "/food/salad-tomato-dish.jpg", label: "Tomato salad", category: "Salad" },

  // Dessert
  { src: "/food/brownies.jpg", label: "Brownies", category: "Dessert" },
  { src: "/food/brownie-chocolate.jpg", label: "Chocolate fudge brownie", category: "Dessert" },
  { src: "/food/cheesecake-lemon.jpg", label: "Lemon cheesecake", category: "Dessert" },
  { src: "/food/pear-chocolate-cake.jpg", label: "Pear and chocolate cake", category: "Dessert" },

  // Drink
  { src: "/food/red-wine.jpg", label: "Red wine", category: "Drink" },
  { src: "/food/boba-tea.jpg", label: "Bubble tea", category: "Drink" },
  { src: "/food/fruit-juice.jpg", label: "Fresh fruit juice", category: "Drink" },
  { src: "/food/sparkling-water.jpg", label: "Sparkling water", category: "Drink" },
  { src: "/food/beer.jpg", label: "Beer", category: "Drink" },
  { src: "/food/espresso.jpg", label: "Espresso", category: "Drink" },
];

const BY_SRC = new Map(FOOD_IMAGES.map((image) => [image.src, image]));

export function isValidFoodImage(src: string): boolean {
  return BY_SRC.has(src);
}

/** Gallery ordered so the current item's own category comes first. */
export function galleryForCategory(category: string): FoodImage[] {
  return [
    ...FOOD_IMAGES.filter((image) => image.category === category),
    ...FOOD_IMAGES.filter((image) => image.category !== category),
  ];
}
