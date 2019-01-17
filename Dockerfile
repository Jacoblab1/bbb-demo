FROM ruby:2.5

# Install app dependencies.
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set an environment variable for the install location.
ENV RAILS_ROOT /usr/src/app

# Set an environment variable for secret_key_base
ENV SECRET_KEY_BASE 6207ad9f3af10eee699ac0d91c610fdfe3bbc33779ba03f4af7d19a91e11005a21d4a92cbbd0b0724e6d94410b6987791c121a2f6b1bec3886fd1575fe333a61

# Make the directory and set as working.
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Set environment variables.
ENV RAILS_ENV production

# Adding project files.
COPY . .

# Install Bundler
RUN gem install bundler

# Install gems.
RUN bundle install --without development test --deployment --clean

# Precompile assets.
RUN bundle exec rake assets:clean
RUN bundle exec rake assets:precompile

# Expose port 80.
EXPOSE 80

# Start the application.
CMD ["bin/start"]
