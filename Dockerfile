FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /rails_project
WORKDIR /rails_project
ADD Gemfile /rails_project/Gemfile
ADD Gemfile.lock /rails_project/Gemfile.lock
RUN bundle install
ADD . /rails_project