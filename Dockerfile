FROM ruby:2.4.1

ENV APP_DIR=/app

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

# Cache bundle install
COPY Gemfile* ./

COPY . $APP_DIR
RUN bundle install