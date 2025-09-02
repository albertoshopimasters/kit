# 4. Solution Strategy

## 4.1 Core Ideas

- Build the app as a **Shopify Remix App** with two extensions:
  - **Admin Extension** (Shopify Polaris): Configure which products are customizable and define allowed options.
  - **Theme App Extension** (Liquid): Visual block in the storefront for customers to customize and buy products.
- Use **PostgreSQL + Prisma ORM** for persistence.
- Ensure modular design for maintainability and future extensibility.

## 4.2 Quality Goals Strategy

- **Usability**: Responsive design, real-time previews, clear flows for customization.
- **Performance**: Server-side rendering (SSR) with Remix, efficient caching of product data.
- **Maintainability**: Well-structured schema for customization options, easily extendable via DB configurations.
- **Security**: Authentication via Shopify OAuth; input validation; blacklist for inappropriate names.

## 4.3 Technology Decisions

- **Frontend**: Liquid for storefront UI; Shopify Polaris for admin UI.
- **Backend**: Remix + Node.js + TypeScript.
- **Database**: PostgreSQL with Prisma.
- **Deployment**: Containerized using Docker/Compose; final hosting on Accenture infrastructure.
