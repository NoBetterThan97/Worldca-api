# frozen_string_literal: true
ruby '2.3.3'

source 'https://rubygems.org'

gem 'sinatra'
gem 'puma'
gem 'json'
gem 'econfig'

gem 'sequel'
gem 'foodnutritionix'

gem 'rake'
gem 'roar'
gem 'multi_json'
gem 'dry-monads'
gem 'dry-container'
gem 'dry-transaction'

gem 'rake'

group :development, :test do
  gem 'pry-byebug'
  gem 'sqlite3'
end

group :test do
  gem 'minitest'
  gem 'minitest-rg'

  gem 'rack-test'

  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'rerun'
  gem 'flog'
  gem 'flay'
end

group :development, :production do
  gem 'tux'
  gem 'hirb'
end

group :production do
  gem 'pg'
end
