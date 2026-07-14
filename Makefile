.PHONY: help up down logs bash console test lint security

help:
	@echo "Available commands:"
	@echo "  up        Start the development services"
	@echo "  down      Stop the development services"
	@echo "  logs      Follow application logs"
	@echo "  bash      Open a shell inside the web container"
	@echo "  console   Open the Rails console"
	@echo "  test      Run the complete RSpec suite in the test environment"
	@echo "  lint      Run RuboCop"
	@echo "  security  Run Brakeman"

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f web

bash:
	docker compose exec web bash

console:
	docker compose exec web bin/rails console

test:
	docker compose exec -e RAILS_ENV=test web bash -c "bin/rails tailwindcss:build && bin/rails db:test:prepare && bundle exec rspec"

lint:
	docker compose exec web bin/rubocop

security:
	docker compose exec web bin/brakeman --no-pager
