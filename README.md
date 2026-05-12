# Help My Net

## Docker

Requirements:

- Docker with Docker Compose v2 (`docker compose`)
- Ruby is provided by the Docker image from `.ruby-version`
- The app uses SQLite, Redis, and Mailcatcher. PostgreSQL is not required.

Build and start the Rails app, Redis, and Mailcatcher:

```bash
docker compose up --build
```

Run in the background:

```bash
docker compose up --build -d
```

Open the app at http://localhost:3000 and Mailcatcher at http://localhost:1080.

Useful development commands:

```bash
docker compose exec web bundle exec rails console
docker compose exec web bundle exec rails db:prepare
docker compose exec web bundle exec rails db:drop db:create db:migrate db:seed
docker compose exec web bundle exec rubocop
docker compose exec web bundle exec brakeman --no-pager --quiet
docker compose down
```

Run the test suite in Docker:

```bash
docker compose exec -e RAILS_ENV=test web bundle exec rails db:prepare
docker compose exec -e RAILS_ENV=test web bundle exec rspec
```

The `RAILS_ENV=test` override is important because the `web` service runs in development mode by default.

For one-off commands before the services are running:

```bash
docker compose run --rm web bundle exec rails db:prepare
docker compose run --rm web bundle exec rails console
```

## Local Ruby

```bash
bundle install
bundle exec rails db:prepare
bundle exec rspec
```
