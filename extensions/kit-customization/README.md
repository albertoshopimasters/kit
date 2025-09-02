# Storefront UI – Kit Customization Extension

This document explains the internal structure and conventions for the **Storefront UI** of the Kit Customization app.

---

## Hierarchy & Roles

We follow a layered hierarchy to organize UI code:

1. **Layout**
   - Defines the container structure.
   - Contains one or more **Blocks** (Snippets).
   - Responsible for arranging the overall look and functionality.
   - Example:
   - `layout-kit-homepage` → the main layout for the customization flow in the homepage.
   - `layout-kit-pdp` → the main layout for the customization flow in the pdp.

2. **Blocks**
   - Individual block can be a group of **Snippets** (functional units).
   - Example:
     - `block-add-to-cart` → block to execute add to cart functionality.
     - `block-competition` → block to select the kit competition.

3. **Components (Snippets)**
   - Small, reusable UI elements (Shopify snippets).
   - Represent atomic features in the customization flow.
   - Examples: `component-equipment`, `component-section-header`, `component-tab-custom`.
   - Should be **independent** and **composable**.

4. **Elements**
   - Even smaller building blocks, often HTML/CSS only.
   - Used inside components (e.g., buttons, inputs, color swatches).
   - Examples: `element-price`, `element-radio`, `element-select`.
   - They should **not** contain business logic.

---

## CSS & Styling Notes

- Shopify only includes **block-level CSS** in the final `<head>` of the storefront HTML.
- **Problem**: If a snippet imports its own CSS, it won’t be applied when that snippet is rendered inside a block.
- **Solution**:
  - For small components/snippets → embed styles using `<style>` tags inside the snippet.
  - For full layouts/blocks → use external CSS files (these are guaranteed to be loaded).
- Guideline:
  - Keep **snippet-level CSS inline**.
  - Keep **block/layout-level CSS external**.

---

## Development Guidelines

- **Naming Convention**:
  - Prefix snippets with `block-`, `component-`, `element-` (e.g., `component-tab-player`) to avoid collisions with theme snippets.
  - Blocks should include context (e.g., `block-media`, `block-personalization`).

- **Composition Rule**:
  - Layout → contains Blocks.
  - Blocks → contain Snippets.
  - Snippets → may use Elements.
  - Elements → no dependency upwards.

- **Reusability**:
  - Write snippets to be composable across different blocks.
  - Avoid hard-coded assumptions (e.g., PDP-only logic inside a snippet).

---

## Example

```text
extension/kit-customization/
│
├── assets/
│   ├── fonts/
│   |   └── FCBarcelona-Bold.web.woff.liquid
│   └── index.css
│
├── blocks/
│   └── layout-kit-homepage.liquid
|
├── locales/
│   ├── en.default.json
│   └── es.json
│
└── snippets/
    ├── block-equipment.liquid
    ├── block-media.liquid
    ├── component-equipment.liquid
    ├── component-section-header.liquid
    ├── element-price.liquid
    └── element-radio.liquid

```
