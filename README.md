# Werner's Panini & Burgers 🍔 🍟 🍕

Restaurant web app for online table reservations and take-away orders.

Originally a final project for "Internet & Mobile Services" at
[UniBZ](https://www.unibz.it/en/faculties/computer-science/bachelor-computer-science/)
(2016–17), built with Java servlets, JSP, Hibernate and MySQL on Tomcat. This
repo now holds a **full rebuild on a modern stack**, with the original code kept
alongside it for comparison.

**▶ [Live demo](https://werners-panini-burgers.vercel.app)** ·
**[Demo accounts](https://werners-panini-burgers.vercel.app/demo)**

Original team: **Werner** S. · M. **Pan**caldi · G. **Burg**io

## Try it

The demo is fully interactive — orders, reservations and menu edits all write to
a real database. It resets to the same seeded data on a schedule, so nothing you
do sticks around.

| Role     | Email                   | Password    |
| -------- | ----------------------- | ----------- |
| Customer | `customer@werners.demo` | `demo1234`  |
| Admin    | `admin@werners.demo`    | `admin1234` |

## Stack

|              | Original (2016–17)          | Rebuild                        |
| ------------ | --------------------------- | ------------------------------ |
| UI           | JSP + Bootstrap + AngularJS | React 19 Server Components     |
| Framework    | Java servlets on Tomcat     | Next.js 16 (App Router)        |
| Requests     | `HttpServlet` subclasses    | Server Actions                 |
| Data access  | Hibernate + custom DAOs     | Prisma 7                       |
| Database     | MySQL                       | Postgres (Neon)                |
| Auth         | `UserSession` table, BCrypt | Signed JWT cookie, bcrypt      |
| Styling      | AdminLTE `skin-red`         | Tailwind CSS 4                 |
| Hosting      | Local Tomcat                | Vercel                         |

## Repo layout

```
├── src/               # Next.js app (App Router)
│   ├── app/           # routes, layouts, server actions
│   ├── components/    # UI components
│   └── lib/           # prisma client, session, DAL, demo dataset
├── prisma/            # schema, migrations, seed
├── public/legacy/     # images and icons carried over from the original
├── legacy/            # the original 2016-17 Java/JSP project
└── .github/workflows/ # hourly demo reset
```

## Running locally

Requires Node 20+, pnpm, and a Postgres database — [Neon](https://neon.tech) has
a free tier and is what the deployed demo uses.

```bash
pnpm install
cp .env.example .env      # then fill in the values
pnpm db:migrate           # apply migrations
pnpm db:seed              # write the demo dataset
pnpm dev
```

Generate the two secrets with `openssl rand -base64 32` each. `DATABASE_URL`
should be Neon's **pooled** connection string (host contains `-pooler`);
`DIRECT_DATABASE_URL` should be the unpooled one, which is what `prisma migrate`
uses.

| Script           | Does                                  |
| ---------------- | ------------------------------------- |
| `pnpm dev`       | Dev server on :3000                   |
| `pnpm build`     | `prisma generate` + production build  |
| `pnpm db:migrate`| Create/apply migrations (dev)         |
| `pnpm db:deploy` | Apply migrations (production)         |
| `pnpm db:seed`   | Reset to the demo dataset             |
| `pnpm db:studio` | Browse the database                   |
| `pnpm lint`      | ESLint                                |

## How it works

**Auth.** Sessions are a signed JWT (`jose`) in an httpOnly cookie; passwords are
bcrypt-hashed. The original kept a `UserSession` row in the database — that would
not survive the demo's scheduled reset, logging everyone out whenever it fired.
Stateless sessions plus demo users seeded at fixed IDs keep a session valid
across a reset.

**Authorization** lives in `src/lib/dal.ts`. `requireAdmin()` re-reads the role
from the database and is called by the `/admin` layout *and* by every admin
server action — actions are individually addressable POST endpoints, so a layout
check alone would not protect them. `src/proxy.ts` (Next.js 16 renamed
Middleware to Proxy) only does a cheap optimistic redirect based on the cookie,
so a stale or tampered role claim can never grant access on its own.

**Item photos.** Each menu item can carry an image, shown on the public menu and
set by an admin from Menu Management. The photos are a fixed gallery committed to
`public/food/` and declared in `src/lib/food-images.ts` — no uploads, no storage
service, no API keys, so the menu looks complete straight after every reset.
That list doubles as an allow-list: `setItemImage` rejects any path not in it, so
a crafted POST can't point `Item.image` at an off-site URL. Every photo is CC0 or
public domain; provenance is recorded in `public/food/CREDITS.md`.

**Demo reset.** `src/lib/demo-data.ts` is the single source of truth for the
seeded dataset, used by both `prisma/seed.ts` and `GET /api/cron/reset`. That
route takes a `CRON_SECRET` bearer token, wipes whatever visitors did and
rewrites the original data. The dataset is fully deterministic — no
`Math.random()` — so every reset produces an identical restaurant.

Two schedulers point at it, because Vercel's Hobby plan allows only one cron run
per day:

- `vercel.json` — daily at 04:00 UTC, the safety net.
- `.github/workflows/reset-demo.yml` — hourly, the real schedule. Needs
  `CRON_SECRET` and `DEMO_BASE_URL` repository secrets.

On Vercel Pro, drop the workflow and set `vercel.json` back to `0 * * * *`.

## The original project

The 2016–17 Java app is preserved in [`legacy/`](legacy/), including the
original MySQL dumps. See [`legacy/README.md`](legacy/README.md) to run it.

Only two of its five roles (`ADMIN`, `CUSTOMER`) are modelled in the rebuild —
the demo does not exercise `DBMANAGER`, `WAITER` or `OVERLORD`.
