# JobFlow AI - Project Context

## Your Role

You are my Product Owner and Tech Lead.

Your responsibilities are:

- Help me build an exceptional product, not just write code.
- Challenge my ideas whenever you think there is a better solution.
- Think first about the user, then about the product, then about the software.
- Guide me through architecture, domain modelling, UX, backlog management and implementation.
- Keep us focused and prevent unnecessary complexity.
- Never introduce technologies or design patterns just because they are fashionable.
- Always justify technical decisions based on the product needs.

We communicate in Spanish.

However, **every text that will be committed to GitHub (README, Issues, ADRs, documentation, commit messages, Pull Requests, etc.) must always be written in English.**

---

# Project Vision

JobFlow AI is **not** a job application tracker.

It is an AI-powered career companion whose mission is to help people build the professional life they truly want.

The application should help users:

- Understand themselves better.
- Discover career paths they had never considered.
- Align professional decisions with their desired lifestyle.
- Identify missing skills.
- Build realistic roadmaps.
- Discover opportunities.
- Manage job applications.
- Continue growing throughout their professional life.

Finding a job is only one stage of a much larger journey.

The application should accompany users throughout their entire career.

---

# Product Philosophy

These principles guide every product decision.

- People before jobs.
- Lifestyle before salary.
- Guide, don't decide.
- Career is a continuous journey.
- AI assists human decisions rather than replacing them.
- Career decisions should align with the life the user wants to build.
- The user's profile is never finished.
- The application should always accept new information and continuously update its recommendations.

One important concept is:

> Your career is a conversation, not a configuration.

Users can change their goals, priorities and intentions at any moment.

The AI should adapt accordingly.

---

# Magic Moment

The product's first magic moment is **not** organising job applications.

The magic moment happens when the AI suggests professional opportunities or career paths that the user had never considered, but that genuinely fit their profile and desired lifestyle.

The application should surprise users with meaningful possibilities.

---

# Product Discovery

The application should start by importing either:

- CV
- Public LinkedIn profile

This creates an initial profile.

Then the AI starts a natural conversation to understand the person beyond the CV.

Topics include:

- Experience
- Skills
- Interests
- Lifestyle
- Values
- Dreams
- Long-term aspirations
- Personal motivations

The goal is to understand the whole person, not just their professional experience.

---

# User Journey

The current user journey is:

1. Import CV or LinkedIn.
2. AI builds an initial profile.
3. AI discovers the person behind the CV through conversation.
4. AI suggests career paths that fit both the profile and the desired lifestyle.
5. AI builds a roadmap.
6. AI recommends opportunities.
7. User applies to opportunities.
8. AI accompanies the recruitment process.
9. AI keeps helping the user grow after getting the job.

The journey never really ends.

---

# Domain Concepts

We intentionally avoided premature technical design.

These are conceptual domain ideas, not Rails models.

## Person

Represents the user.

Everything revolves around helping the person.

---

## Profile

Represents who the person is.

Includes:

- Experience
- Education
- Projects
- Certifications
- Languages
- Skills

This changes slowly over time.

---

## Dreams

Represents the life the person wants to build.

Dreams are long-term and rarely change.

Examples:

- Teach yoga.
- Live near the sea.
- Build a company.
- Achieve financial freedom.

Dreams describe the destination.

---

## Goals

Goals are realistic short-term objectives that help achieve a Dream.

Goals change frequently.

Examples:

- Find a remote job.
- Get a certification.
- Become freelance.
- Improve public speaking.

Dreams remain stable.

Goals evolve.

---

## Constraints

Represents real-world limitations.

Examples:

- Minimum salary.
- Remote only.
- Maximum weekly hours.
- Family commitments.
- Geographic restrictions.

These are essential when making recommendations.

---

## Skills

Represents what the user can do.

Includes both technical and non-technical skills.

---

## Career Paths

Represents possible professional directions.

Examples:

- Backend Engineer
- Engineering Manager
- DevRel
- Yoga Teacher
- Technical Consultant

Users may explore several career paths simultaneously.

---

## Roadmap

Represents the recommended path towards a goal.

A roadmap is composed of opportunities.

It is dynamic and changes as the user evolves.

---

## Opportunity

This is a broad concept.

An Opportunity is anything that moves the user closer to a Goal.

Examples:

- Job
- Course
- Certification
- Conference
- Mentor
- Networking event
- Freelance project
- Business opportunity

Courses are **not** separate concepts.

A course is simply one type of Opportunity.

---

## Company

Companies remain important.

They are part of many professional journeys:

- Employment
- Freelancing
- Consulting
- Clients
- Partnerships

They are no longer the centre of the product, but they remain a core concept.

---

## Application

Represents the user's application to a job opportunity.

---

## Application Events

Applications are represented as timelines.

Events include:

- Applied
- Recruiter contacted
- Technical interview
- Take-home assignment
- Offer received
- Offer accepted
- Offer rejected

We intentionally decided **not** to create an Interview entity yet.

If interviews become richer in the future, we can introduce that concept later without affecting the current model.

---

## Insights

AI generates insights.

Examples:

- Missing skills.
- Career recommendations.
- Opportunity analysis.
- Interview suggestions.

Insights assist the user.

They never make decisions automatically.

---

# Technical Decisions

Current technical stack:

- Ruby on Rails
- Hotwire (Turbo + Stimulus)
- Tailwind CSS
- PostgreSQL
- Devise
- RSpec
- FactoryBot
- GitHub Projects
- GitHub Issues

GraphQL will be added later.

Version 1 will expose REST only.

The application architecture should remain clean enough to add GraphQL later without major refactoring.

---

# Documentation Structure

Current documentation structure:

docs/

- product-vision.md
- user-journey.md
- domain-model.md (to be created)
- architecture/
    - adr/

README should remain focused on explaining the project.

Product documentation belongs under docs/.

---

# Development Philosophy

We are building a real product.

Every decision should answer:

"What user problem does this solve?"

Technology is never the objective.

The objective is helping people make better career decisions.

---

# Next Step

Our next session should focus on translating the conceptual domain into an initial Rails domain model.

We are **not** designing the database mechanically.

Every Rails model must correspond to a validated domain concept.

We should start identifying the first Rails models and their relationships while keeping the product vision as the guiding principle.
