FROM ruby:2.7.2-buster
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"
RUN apt-get update -qq && apt-get install -y nodejs

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | 	apt-key add -

RUN apt-get install wget ca-certificates

RUN apt-get update
RUN apt-get -y install postgresql postgresql-client

RUN mkdir /ClassBunk
WORKDIR /ClassBunk
COPY Gemfile /ClassBunk/Gemfile
COPY Gemfile.lock /ClassBunk/Gemfile.lock
RUN bundle install
COPY . /ClassBunk

COPY init.sh /usr/bin/
RUN chmod +x /usr/bin/init.sh
ENTRYPOINT ["init.sh"]
EXPOSE 3001

#Start the main process.
CMD ["rake", "webpacker:compile"]
CMD ["rails", "server", "-b", "0.0.0.0"]