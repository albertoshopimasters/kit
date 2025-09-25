# 1. Introduction and Goals

## 1.1 Purpose

The goal of this document is to describe the architecture of the **Kit Customization App**, a Shopify application that allows customers to customize football shirts directly from the storefront.

## 1.2 Requirements Overview

- Configure from an admin dashboard which products are available for customization.
- Allow customers to personalize products (shirts) through a visual block in the storefront.
- Support personalization options: gender/age group, size, player, and competition.
- Integrate with Shopify Storefront API for products, variants, stock, and pricing.
- Allow adding products to cart directly from the visual block.
- Comply with security and scalability standards; deployment on private infrastructure (Accenture responsibility).

## 1.3 Quality Goals

The most important quality attributes are:

1. **Usability**
   - Smooth and intuitive customization flow for end users.
   - Clear and responsive design for both desktop and mobile.

2. **Performance**
   - Low latency when rendering customization options.
   - Fast integration with Shopify Storefront API and backend.

3. **Maintainability (Customization extensibility)**
   - Easy to extend personalization options (new kits, competitions, players).
   - Configuration should be manageable without heavy code changes.

4. **Security (Controlled customization)**
   - Only authorized admins can define available customizations.
   - Prevent inappropriate or offensive customizations (e.g., name blacklist).

## 1.4 Stakeholders

- **Ignacio Iserte (Project Manager)** – Responsible for planning and delivery.
- **Alberto Lopez (Developer)** – Co-responsible for implementation.
- **Pedro Blanco (Infrastructure)** – Responsible for deployment and hosting.
- **Pablo Koll (Developer, Author)** – Backend/frontend development and documentation.
