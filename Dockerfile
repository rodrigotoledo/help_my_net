ARG RUBY_VERSION=4.0.2
FROM ruby:${RUBY_VERSION}-slim

ENV BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    DEBIAN_FRONTEND=noninteractive \
    RAILS_ENV=development

WORKDIR /rails

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential \
      ca-certificates \
      curl \
      git \
      imagemagick \
      libsqlite3-dev \
      libvips \
      libyaml-dev \
      pkg-config \
      sqlite3 && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock .ruby-version ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bash", "-lc", "rm -f tmp/pids/server.pid && bundle exec rails db:prepare && bundle exec rails server -b 0.0.0.0"]
