# 7. Deployment View

## 7.1 Infrastructure

- **Frontend (Theme Extension)**: Runs inside Shopify storefront as an embedded block.
- **Frontend (Admin Extension)**: Runs inside Shopify Admin as an embedded UI (Polaris).
- **Backend (Remix App)**: Node.js application running in a container.
- **Database**: PostgreSQL container/service.

## 7.2 Target Environment

- All components deployed in **Barça-managed infrastructure**.
- Containerization: **Docker** or **Docker Compose**.
- Communication:
  - Backend ↔ Shopify APIs (HTTPS).
  - Backend ↔ PostgreSQL (internal network).
  - Frontend extensions ↔ Backend (HTTPS).

## 7.3 Deployment Diagram (textual)

- **Barça Infrastructure**:
  - **Docker Host**: Runs Remix Backend and PostgreSQL containers.
  - **Shopify Storefront**: Hosts Theme Extension (Liquid block).
  - **Shopify Admin**: Hosts Admin Extension (Polaris UI).
