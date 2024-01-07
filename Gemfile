source "https://rubygems.org"

ruby "3.2.2"

# Default Gems
gem "rails", github: "rails/rails", branch: "main"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# Custom Gems
gem "aws-sdk-s3", "~> 1.142"
gem "faraday"
gem "geared_pagination", "~> 1.2"
gem "solid_queue", github: "basecamp/solid_queue", branch: "main"
gem "tailwindcss-rails", "~> 2.1"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# Use Redis for Action Cable
gem "redis", "~> 4.0"

