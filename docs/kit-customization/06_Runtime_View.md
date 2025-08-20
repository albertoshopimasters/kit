# 6. Runtime View

## 6.1 Typical Scenario: Customer Customizes and Buys a Shirt

1. Customer opens product page in Shopify storefront.
2. Theme Extension loads customization block.
3. Block fetches available options from Remix Backend.
4. Backend fetches price/stock from Shopify Storefront API.
5. Customer selects size, player, competition, and enters name.
6. Backend validates input (e.g., name blacklist).
7. Customer confirms selection → product variant with personalization is added to cart.

## 6.2 Admin Scenario: Configure Customizable Products

1. Admin opens Shopify Admin dashboard.
2. Admin navigates to Kit Customization App.
3. Admin selects products and defines customization rules (options, restrictions, blacklist updates).
4. Data is saved in PostgreSQL via Remix Backend.
5. Changes are immediately available in storefront.
