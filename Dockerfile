FROM ruby:2.5.0

RUN apt-get update -y && \
    apt-get install default-mysql-client nodejs -y && \
    gem install rails --version='5.2.4.1'
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock
RUN gem install bundler:2.1.4
RUN bundler --version
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]


