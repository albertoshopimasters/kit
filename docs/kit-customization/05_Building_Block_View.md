# 5. Building Block View

## 5.1 Level 1 (System Overview – C4 Container Diagram)

- **Kit Customization App**
  - Admin Extension (Polaris UI)
  - Theme Extension (Liquid component)
  - Remix Backend API
  - PostgreSQL Database

```mermaid
C4Container
    title Kit Customization App – Container Diagram

    Enterprise_Boundary(b0, "KitCustomizationEnterprise") {
        Person(Customer, "Customer", "End user who customizes and purchases football shirts")
        Person(Admin, "Shopify Admin", "Manages product selection and customization rules")

        System_Boundary(b1, "Kit_Customization_App") {
            Container(StorefrontExtension, "Theme App Extension", "Liquid", "Embedded storefront block for customer customization and add-to-cart")
            Container(Backend, "Remix Backend API", "Node.js + TypeScript", "Handles authentication, business logic, and API for storefront and admin extensions")
            Container(AdminExtension, "Admin Extension", "React + Polaris", "Embedded Shopify admin UI for product and customization configuration")
            Container(Database, "PostgreSQL + Prisma", "Database", "Stores products, customization options, and configuration data")
        }

        System_Ext(Shopify_Storefront_API, "Shopify Storefront API", "Provides product data, variants, stock, pricing, and add-to-cart operations")
        System_Ext(Shopify_Admin_API, "Shopify Admin API", "Provides authentication and product listing")
    }

    %% Relationships
    BiRel(Customer, StorefrontExtension, "Interacts with customization UI and adds products to cart")
    BiRel(Admin, AdminExtension, "Configures products and customization options")
    BiRel(StorefrontExtension, Backend, "Fetches customization options and validates input")
    BiRel(AdminExtension, Backend, "Reads and writes configuration data")
    BiRel(Backend, Database, "Reads/Writes product and customization data")
    BiRel(Backend, Shopify_Storefront_API, "Fetches product info, stock, pricing, and submits cart")
    BiRel(Backend, Shopify_Admin_API, "Authenticates and retrieves product lists")

    UpdateRelStyle(StorefrontExtension, Backend, $offsetX="-100", $offsetY="35")
    UpdateRelStyle(Customer, StorefrontExtension, $offsetX="-250", $offsetY="30")
    UpdateRelStyle(Admin, AdminExtension, $offsetX="-70", $offsetY="70")
    UpdateRelStyle(Backend, Shopify_Storefront_API, $offsetX="10", $offsetY="-30")
    UpdateRelStyle(Backend, Shopify_Admin_API, $offsetX="0", $offsetY="25")
    UpdateLayoutConfig($c4ShapeInRow="2", $c4BoundaryInRow="1")
```

## 5.2 Level 2 (Main Components – C4 Component Diagram)

- **Remix Backend**
  - Auth Controller (Shopify OAuth)
  - Admin API Controller (customization config)
  - Storefront API Proxy (fetch product data, stock, pricing)
  - Validation Module (blacklist checks, input sanitization)
  - Persistence Layer (Prisma + PostgreSQL)

  ```mermaid
  C4Component
    title Kit Customization App – Backend Component Diagram

    Container_Boundary(Backend, "Remix Backend API") {
        Component(AuthController, "Auth Controller","", "Handles Shopify OAuth authentication for admins and storefront")
        Component(AdminAPIController, "Admin API Controller", "", "Provides endpoints for configuration of products and customization options")
        Component(StorefrontAPIProxy, "Storefront API Proxy", "", "Fetches product data, variants, stock, and pricing from Shopify Storefront API")
        Component(ValidationModule, "Validation Module", "", "Performs blacklist and input validation for customization fields")
        Component(PersistenceLayer, "Persistence Layer", "", "Prisma ORM for PostgreSQL database access")
    }

    %% Relationships
    BiRel(Admin, AdminAPIController, "Configures products and customization options")
    BiRel(StorefrontExtension, StorefrontAPIProxy, "Fetches available options and validates input")
    BiRel(AuthController, AdminAPIController, "Provides authentication tokens")
    BiRel(AdminAPIController, PersistenceLayer, "Reads/Writes configuration and product data")
    BiRel(StorefrontAPIProxy, PersistenceLayer, "Reads product and customization data")
    BiRel(StorefrontAPIProxy, Shopify_Storefront_API, "Fetches product info, stock, pricing")

  ```

- **Admin Extension**
  - Config UI
  - Product Selection
  - Customization Rules Management

```mermaid
C4Component
      title Kit Customization App – Admin Extension Component Diagram
      Container_Boundary(AdminExtension, "Admin Extension (React + Polaris)") {
          Component(ProductSelector, "Product Selector", "", "Allows the admin to select which products are customizable")
          Component(CustomizationConfigurator, "Customization Configurator", "", "Allows the admin to define available customization options per product")
          Component(ProductActivationToggle, "Product Activation Toggle", "","Activate or deactivate products for customization")
          Component(AdminAPIClient, "Admin API Client", "","Handles API calls to the backend for reading/writing configuration")
          Component(AuthContext, "Auth Context", "","Manages authentication state and access tokens")
      }
      BiRel(ProductSelector, AdminAPIClient, "Fetches product list and selection")
      BiRel(CustomizationConfigurator, AdminAPIClient, "Saves customization options and reads existing configuration")
      BiRel(ProductActivationToggle, AdminAPIClient, "Updates active state of products")
      BiRel(AuthContext, AdminAPIClient, "Provides authentication tokens for API requests")
    UpdateRelStyle(ProductSelector, AdminAPIClient, $offsetX="-100", $offsetY="5")
    UpdateRelStyle(CustomizationConfigurator, AdminAPIClient, $offsetX="-100", $offsetY="-25")
    UpdateRelStyle(AuthContext, AdminAPIClient, $offsetX="-100", $offsetY="35")
    UpdateLayoutConfig($c4ShapeInRow="3")
```

- **Theme Extension**
  - UI Renderer (Liquid block)
  - Cart Integration
  - Live Preview

```mermaid
    C4Component
      title Kit Customization App – Storefront Extension Component Diagram

      Container_Boundary(StorefrontExtension, "Theme App Extension (Liquid)") {
          %% Layout Blocks
          Component(HomeKitBlock, "Home Kit Teaser Block", "Simplified block for homepage")

          %% Snippets / Components
          Component(ChoosePlayerSnippet, "Choose Player Snippet", "", "Allows the customer to select a player")
          Component(ChooseSizeSnippet, "Choose Size Snippet", "", "Allows the customer to select a size")
          Component(ChooseEquipmentSnippet, "Choose Equipment Snippet", "", "Allows the customer to select kit type")

          %% Utility Modules
          Component(StorefrontAPIClient, "Storefront API Client", "", "Fetches product info and adds items to cart")
          Component(ValidationModule, "Validation Module", "", "Performs blacklist checks and validates customer input")
      }

      %% Relationships
      BiRel(HomeKitBlock, ChoosePlayerSnippet, "Uses snippet")
      BiRel(HomeKitBlock, ChooseSizeSnippet, "Uses snippet")

      BiRel(HomeKitBlock, StorefrontAPIClient, "Fetches product options and adds to cart")
      BiRel(ChoosePlayerSnippet, ValidationModule, "Validates player selection")
      BiRel(ChooseEquipmentSnippet, ValidationModule, "Validates kit selection")

    UpdateRelStyle(HomeKitBlock, ChoosePlayerSnippet, $offsetX="-35", $offsetY="15")
    UpdateRelStyle(ChoosePlayerSnippet, ValidationModule, $offsetX="-140", $offsetY="85")
    UpdateRelStyle(HomeKitBlock, StorefrontAPIClient, $offsetX="-100", $offsetY="65")
    UpdateLayoutConfig($c4ShapeInRow="2")
```
