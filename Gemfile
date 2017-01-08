# frozen_string_literal: true
ruby '2.3.1'

source 'https://rubygems.org'

gem 'aws-sdk'
gem 'concurrent-ruby'
gem 'dry-container'
gem 'dry-monads'
gem 'dry-transaction'
gem 'econfig'
gem 'faye', '= 1.1.2'
gem 'foodnutritionix'
gem 'json'
gem 'multi_json'
gem 'puma'
gem 'rake'
gem 'roar'
gem 'sequel'
gem 'shoryuken'
gem 'sinatra'

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
  gem 'flay'
  gem 'flog'
  gem 'rerun'
  gem 'rubocop'
end

group :development, :production do
  gem 'hirb'
  gem 'tux'
end

group :production do
  gem 'pg'
end
