FROM ruby:3.2.2-alpine AS chat

RUN apk --update add \
    build-base \
    tzdata \
    yarn \
    libc6-compat \
    postgresql-dev \
    postgresql-client \
    curl \
    && rm -rf /var/cache/apk/*

WORKDIR /app

COPY Gemfile* /app/
RUN gem update --system 3.5.17
RUN gem install bundler -v $(tail -n 1 Gemfile.lock)
#RUN bundle config set without 'development test'
RUN bundle check || bundle install
RUN bundle clean --force

ENTRYPOINT ["./docker-entrypoint.sh"]