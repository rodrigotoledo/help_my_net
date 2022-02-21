FROM ruby:3.0.3

ENV INSTALL_PATH /opt/app

RUN apt-get install -y libsqlite3-dev

RUN mkdir -p $INSTALL_PATH

ENV REDIS_URL redis:6379

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

RUN gem install bundler --no-doc

RUN bundle install

COPY . $INSTALL_PATH

