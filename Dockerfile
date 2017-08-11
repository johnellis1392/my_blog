FROM ruby:alpine
WORKDIR /usr/src/app
EXPOSE 3000

RUN apk add --update g++ make postgresql-dev
RUN gem update

COPY Gemfile Gemfile
RUN bundle update && bundle install

COPY . .
ENTRYPOINT [ "./startup.sh" ]
