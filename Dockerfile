# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.3.6
FROM ruby:${RUBY_VERSION}-slim

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential \
      curl \
      git \
      libpq-dev \
      libvips \
      pkg-config \
      postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

WORKDIR /rails

ENV BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_JOBS="4" \
    BUNDLE_RETRY="3"

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY bin/docker-entrypoint /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
CMD ["bash"]
