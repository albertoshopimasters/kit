# 9. Architectural Decisions

## ADR-001: Use Remix App Template

- Context: Shopify recommends Remix for building modern apps.
- Decision: Use Remix with Node.js + TypeScript.
- Status: Accepted.

## ADR-002: Database Choice

- Context: Need relational schema, extendable and well-integrated.
- Decision: Use PostgreSQL with Prisma ORM.
- Status: Accepted.

## ADR-003: UI Frameworks

- Context: Shopify Polaris required for admin; storefront must be flexible.
- Decision: Use Polaris (Admin), Liquid (Storefront).
- Status: Accepted.

## ADR-004: Security Constraints

- Context: Prevent inappropriate customizations.
- Decision: Implement blacklist and authorization checks.
- Status: Accepted.

## ADR-005: Deployment

- Context: Infrastructure managed by Barça.
- Decision: Containerize with Docker; final orchestration TBD.
- Status: Pending.
