FROM ruby:3.3-bookworm

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential libsqlite3-dev libyaml-dev curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /rails

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
RUN chmod +x /rails/bin/docker-entrypoint \
    && sed -i 's/\r$//' /rails/bin/docker-entrypoint

EXPOSE 3000
# Invoke via bash so a missing +x bit still works; compose overrides on Windows mounts.
ENTRYPOINT ["bash", "/rails/bin/docker-entrypoint"]
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
