# 3. System Scope and Context

## 3.1 Business Context

The Kit Customization App integrates into a Shopify store and provides:

- An **admin interface** for merchants to configure customizable products.
- A **storefront block** that allows end customers to personalize and purchase products.

Primary interactions:

- **Shopify Admins** configure which products are customizable.
- **End Customers** personalize and purchase products directly from the storefront.

## 3.2 Technical Context

Main components and external systems:

- **Shopify Storefront API**
  - Provides product data, variants, prices, and stock.
  - Handles add-to-cart functionality.

- **Shopify Admin API**
  - Used minimally for authentication and listing products in admin.

### System Context Diagram (textual)

- **Customer (browser)** → interacts with **Theme App Extension** (Liquid block).
- **Theme App Extension** → communicates with **Remix Backend API** and **Shopify Storefront API**.
- **Admin (Shopify)** → interacts with **Admin Extension (Polaris UI)**.
- **Admin Extension** → communicates with **Remix Backend API** and **PostgreSQL database**.

### System Context Diagram (visual)

```mermaid
C4Context
    title System Context diagram for Kit Customization App

    Enterprise_Boundary(b0, "KitCustomization") {
        %% Actors
        Person(Customer, "Customer", "End user who customizes and purchases football shirts from the Shopify storefront")
        Person(Admin, "Shopify Admin", "Manages product selection, customization options, and settings in the admin dashboard")

        %% Main System
        System(Kit_Customization_App, "Kit Customization App", "Shopify app that allows product customization via storefront blocks and admin configuration")

        %% External Systems
        System_Ext(Shopify_Storefront_API, "Shopify Storefront API", "Provides product data, variants, stock, pricing, and handles add-to-cart operations")
        System_Ext(Shopify_Admin_API, "Shopify Admin API", "Provides minimal access for authentication and listing products in the admin")
    }

    %% Relationships
    BiRel(Customer, Kit_Customization_App, "Uses storefront blocks to customize products and add to cart")
    BiRel(Admin, Kit_Customization_App, "Configures available products and customization rules via Admin Extension")
    BiRel(Kit_Customization_App, Shopify_Storefront_API, "Fetches product data, pricing, stock, and adds products to cart")
    BiRel(Kit_Customization_App, Shopify_Admin_API, "Authenticates and retrieves product lists for admin configuration")

    UpdateRelStyle(Kit_Customization_App, Shopify_Storefront_API, $offsetX="-80", $offsetY="30")
```
