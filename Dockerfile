# Use the official Ruby image from the Docker Hub
FROM ruby:3.2.2

# Set environment variables for Rails
ENV RAILS_ENV=development
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_DATABASE_USERNAME=mahmouddabbbagh
ENV RAILS_DATABASE_PASSWORD=password
ENV RAILS_DATABASE_HOST=db

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Create and set the working directory
RUN mkdir /matrix
WORKDIR /matrix


# Add Gemfile and Gemfile.lock to the container
ADD Gemfile /matrix/Gemfile
ADD Gemfile.lock /matrix/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
