This folder contains a **modern rebuild** of the original uni project (Java/JSP +
Hibernate + MySQL on Tomcat), implemented with **Next.js 16, Prisma 7 and
Postgres** for portfolio/demo purposes.

## Getting started

### 1) Install deps

```bash
pnpm install
```

### 2) Set up env

Copy `.env.example` to `.env` and fill it in. You need a Postgres database —
[Neon](https://neon.tech) has a free tier and is what the deployed demo uses.

```bash
cp .env.example .env
openssl rand -base64 32   # use for SESSION_SECRET
openssl rand -base64 32   # use for CRON_SECRET
```

`DATABASE_URL` should be Neon's **pooled** connection string (the host contains
`-pooler`); `DIRECT_DATABASE_URL` should be the unpooled one, which is what
`prisma migrate` uses.

### 3) Create + seed the DB

```bash
pnpm db:migrate   # apply migrations (dev)
pnpm db:seed      # write the demo dataset
```

### 4) Run

```bash
pnpm dev
```

Open `http://localhost:3000`.

## Demo accounts

Seeded by `pnpm db:seed` and listed in-app at `/demo`:

| Role     | Email                  | Password    |
| -------- | ---------------------- | ----------- |
| Customer | `customer@werners.demo` | `demo1234`  |
| Admin    | `admin@werners.demo`    | `admin1234` |

## Implemented flows

- `GET /menu` — browse menu + add to cart
- `GET /checkout` — place an order (server action) → `GET /orders/:id`
- `GET /reservations` — create reservation (server action) → `GET /reservations/:id`
- `GET /login`, `GET /register` — session auth
- `GET /admin/*` — staff back office (orders, menu, reservations)
- `GET /demo` — demo credentials and one-click sign-in

## Architecture notes

**Auth.** Sessions are a signed JWT (`jose`) in an httpOnly cookie, with
passwords hashed via bcrypt. The original app kept a `UserSession` row in the
database; that would not survive the hourly demo reset, so the rebuild is
stateless and the demo users are re-seeded with fixed IDs to keep existing
sessions valid.

**Authorization** happens in `src/lib/dal.ts`. `requireAdmin()` re-reads the role
from the database and is called by the `/admin` layout *and* by every admin
server action — actions are individually addressable POST endpoints, so a layout
check alone would not protect them. `src/proxy.ts` (Next.js 16 renamed
Middleware to Proxy) only does a cheap optimistic redirect using the cookie.

**Demo reset.** `src/lib/demo-data.ts` is the single source of truth for the
seeded dataset, used by both `prisma/seed.ts` and `GET /api/cron/reset`. Vercel
Cron hits that route hourly (see `vercel.json`) with a `CRON_SECRET` bearer
token, wiping whatever visitors did and rewriting the original data. Everything
in the dataset is deterministic — no `Math.random()` — so every reset produces an
identical restaurant.

## Notes

- The original Java project lives in the repo root (`src/`, `WebContent/`, `pom.xml`).
- Only two of the original five roles (`ADMIN`, `CUSTOMER`) are modelled — the
  demo does not exercise `DBMANAGER`, `WAITER` or `OVERLORD`.
