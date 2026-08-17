FROM ruby:3.3-bookworm

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential libsqlite3-dev libyaml-dev curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /rails

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000
ENTRYPOINT ["/rails/bin/docker-entrypoint"]
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
