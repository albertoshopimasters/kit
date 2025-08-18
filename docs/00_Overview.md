# Global System Overview

This repository contains the architectural documentation for a system that includes **two applications**:

- **Kit Customization**: [link to `kit-customization/01_Introduction_Goals.md`](./kit-customization/01_Introduction_Goals.md)  
  Purpose, goals, and architecture of the first application.
- **Image Generator**: [link to `image-generator/01_Introduction_Goals.md`](./image-generator/01_Introduction_Goals.md)  
  Purpose, goals, and architecture of the second application.

## Relationship between Applications

- Describe whether the apps are independent or tightly coupled.
- Define integration points (e.g., shared authentication, APIs, databases).
- Explain deployment strategy: independent deployments vs. shared infrastructure.

## Shared Concerns

- Cross-cutting concepts that apply to both apps (e.g., security policies, monitoring, CI/CD).
- Global ADRs that impact both applications.

## Navigation

Each subfolder (`kit-customization/`, `image-generator/`) follows the arc42 template with C4 diagrams.
