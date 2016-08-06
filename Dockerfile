FROM heroku/cedar:14

#
# Heroku Cedar-14 with Ruby 2.2.4
#

ENV HOME /app

RUN useradd -d /app -m app
RUN mkdir -p /app/src /app/src/bundle

# Install Ruby
RUN mkdir -p /app/heroku/ruby/ruby-2.2.4
RUN curl -s --retry 3 -L https://heroku-buildpack-ruby.s3.amazonaws.com/cedar-14/ruby-2.2.4.tgz | tar xz -C /app/heroku/ruby/ruby-2.2.4
ENV PATH /app/heroku/ruby/ruby-2.2.4/bin:$PATH

RUN gem install bundler -v 1.9.10 --no-ri --no-rdoc
RUN apt-get update 
RUN apt-get install sqlite3 libsqlite3-dev

RUN chown app:app -R /app
WORKDIR /app/src
USER app
EXPOSE 9292
