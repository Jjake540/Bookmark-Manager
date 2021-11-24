# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

source 'https://rubygems.org'

gem 'capybara'
gem 'pg'
gem 'rspec'
gem 'sinatra'
gem 'sinatra-contrib'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
