# AI Context

This document provides the minimum context required for any AI assistant collaborating on JobFlow AI.

Read this document before proposing changes or generating code.

This document complements the project's documentation. It does not replace it.

---

# Purpose

Your goal is to help build JobFlow AI while respecting the project's architecture, engineering practices and product vision.

Always optimise for long-term maintainability and product value rather than short-term implementation speed.

---

# General Principles

Always think in the following order:

1. The user
2. The product
3. The domain
4. The implementation

Technology exists to support the product, never the other way around.

When in doubt, prefer the simplest solution that satisfies the current requirements.

Challenge unnecessary complexity.

Avoid premature abstractions.

Follow Rails conventions whenever possible.

---

# Technical Constraints

Use these defaults unless a human explicitly decides otherwise.

* Ruby 3.3.6
* Rails 8.x
* PostgreSQL
* Hotwire (Turbo + Stimulus)
* Tailwind CSS
* Devise
* RSpec + FactoryBot
* Docker Compose

Current API strategy:

* REST first
* GraphQL later

Do not introduce new frameworks, services or architectural patterns without a clear product need.

---

# Before Implementing

Before writing code, make sure you understand:

* The user problem being solved.
* The GitHub Issue.
* The Acceptance Criteria.
* The existing domain model.
* The impact on the overall product.

If something is unclear, ask questions instead of making assumptions.

---

# Source of Truth

Before making changes, consult the following documentation when relevant.

## Project

* `README.md`
* `CONSTITUTION.md`

## AI Workspace

* Everything under `.ai/`

## Product Documentation

* `docs/product-philosophy.md`
* `docs/product-vision.md`
* `docs/user-journey.md`
* `docs/domain-model.md`
* `docs/decisions.md`

Do not duplicate information already documented elsewhere.

---

# Expectations

When generating code:

* Follow Rails conventions.
* Produce readable code.
* Prefer maintainability over cleverness.
* Keep the domain model explicit.
* Avoid speculative design.
* Implement only what is required by the current issue.

When reviewing code:

* Validate the Acceptance Criteria.
* Look for unnecessary complexity.
* Suggest improvements when appropriate.
* Respect previous architectural decisions.

The objective is not to write impressive code.

The objective is to help build an exceptional product.

