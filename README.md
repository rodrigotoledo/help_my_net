# README

```bash
docker-compose run web rails db:drop db:create db:migrate db:seed
docker-compose run web rails c
```

## Fix project issues

```bash
bundle exec rubocop || true
bundle exec brakeman --no-pager --quiet || true
```

## Testing

```bash
bundle exec rspec .
```
