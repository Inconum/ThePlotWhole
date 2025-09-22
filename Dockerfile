FROM ruby:3.4

# Install dependencies for building native gems and Node.js for Jekyll
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install missing default gems for Ruby 3.4
RUN gem install bigdecimal logger

WORKDIR /app

# Copy Gemfile and Gemfile.lock first for caching
COPY Gemfile* ./

# Install bundler and gems
RUN gem install bundler
RUN bundle install

# Copy the rest of your site
COPY . .

# Serve Jekyll on all interfaces
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
