# Dockerfile
# Use ruby image to build our own image
FROM ruby:3.0
# We specify everything will happen within the /app folder inside the container
WORKDIR /app

RUN apt-get update -qq \
  && apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn postgresql-client \
  && rm -rf /var/lib/apt/lists/*

# We copy these files from our current application to the /app container
COPY Gemfile Gemfile.lock ./
# We install all the dependencies
RUN bundle install
# We copy all the files from our current application to the /app container
COPY . .
# We expose the port
EXPOSE 3000
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
