FROM ruby
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
#ADD Gemfile /myapp/Gemfile
#ADD Gemfile.lock /myapp/Gemfile.lock
ADD . /myapp

RUN bundle install

#CMD ["bundle exec rails s -p 3000 -b '0.0.0.0'"]
