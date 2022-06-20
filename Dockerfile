FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm
RUN npm i -g yarn && yarn

RUN mkdir /Rails_project
WORKDIR /Rails_project
COPY Gemfile /Rails_project/Gemfile
COPY Gemfile.lock /Rails_project/Gemfile.lock
RUN bundle install
COPY . /Rails_project

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]