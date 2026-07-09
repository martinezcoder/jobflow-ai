# JobFlow AI

JobFlow AI is an AI-powered career companion that helps people build a professional life aligned with the life they want to live.

Unlike traditional job application trackers, JobFlow AI supports users throughout their entire career journey—from discovering new career paths and identifying skill gaps to applying for opportunities and continuing to grow after getting a job.

## Philosophy

JobFlow AI is built around a few core principles:

* People before jobs.
* Lifestyle before salary.
* Guide, don't decide.
* AI assists human decisions.
* Careers evolve through continuous conversations, not static profiles.

Technology is a means to support these principles, never the goal itself.

## Tech Stack

The current stack includes:

* Ruby on Rails
* PostgreSQL
* Hotwire (Turbo + Stimulus)
* Tailwind CSS
* Devise
* RSpec
* FactoryBot

The architecture is intentionally kept simple, following Rails conventions whenever possible.

## Documentation

Project documentation is located in the `docs/` directory.

| Document             | Purpose                                                          |
| -------------------- | ---------------------------------------------------------------- |
| `project-context.md` | Overall product vision, domain and technical direction.          |
| `product-vision.md`  | Explains why the product exists and the problems it solves.      |
| `user-journey.md`    | Describes the end-to-end user experience.                        |
| `domain-model.md`    | Defines the project's business concepts and their relationships. |
| `decisions.md`       | Records important product and technical decisions.               |

Additional guidance for AI assistants can be found in:

* `AI_CONTEXT.md`
* `CONSTITUTION.md`
* `.ai/`

## Getting Started

Development runs entirely inside Docker. You only need Docker and Docker Compose on your host machine.

### Prerequisites

* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/)

### Setup

```bash
git clone <repository-url>
cd jobflow-ai

cp .env.example .env
docker compose build
docker compose up -d
docker compose exec web bin/rails db:create db:migrate
```

The application is available at [http://localhost:3000](http://localhost:3000).

### Working inside the container

Run commands in the Rails container:

```bash
docker compose exec web bash
```

Run one-off commands without opening a shell:

```bash
docker compose exec web bin/rails db:migrate
docker compose exec web bin/rails console
```

Verify PostgreSQL is reachable from the web container:

```bash
docker compose exec web pg_isready -h db -U jobflow -d jobflow_ai_development
```

Stop the environment:

```bash
docker compose down
```

## Development Principles

* Follow Rails conventions.
* Keep the domain model simple and explicit.
* Every Rails model should represent a validated business concept.
* Prefer incremental improvements over premature abstractions.
* Write tests where they increase confidence.

## Contributing

Before contributing, please read:

* `CONSTITUTION.md`
* `AI_CONTEXT.md`
* `docs/project-context.md`

These documents describe the philosophy and engineering principles that guide the project.

## License

TBD
