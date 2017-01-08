# frozen_string_literal: true
require 'rake/testtask'

task :default do
  puts `rake -T`
end

Rake::TestTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.warning = false
end

desc 'delete cassette fixtures'
task :wipe do
  sh 'rm spec/fixtures/cassettes/*.yml' do |ok, _|
    puts(ok ? 'Cassettes deleted' : 'No casseettes found')
  end
end

namespace :db do
  task :_setup do
    require 'sequel'
    require_relative 'init'
    Sequel.extension :migration
  end

  desc 'Run database migrations'
  task migrate: [:_setup] do
    puts "Migrating to latest for: #{ENV['RACK_ENV'] || 'development'}"
    Sequel::Migrator.run(DB, 'db/migrations')
  end

  desc 'Reset migrations (full rollback and migration)'
  task reset: [:_setup] do
    Sequel::Migrator.run(DB, 'db/migrations', target: 0)
    Sequel::Migrator.run(DB, 'db/migrations')
  end
end

namespace :queue do
  require 'aws-sdk'
  require_relative 'init'

  desc 'Create SQS queue for Shoryuken'
  task :create do
    config = WorldCaAPI.config
    sqs = Aws::SQS::Client.new(
      access_key_id: config.AWS_ACCESS_KEY_ID,
      secret_access_key: config.AWS_SECRET_ACCESS_KEY,
      region: config.AWS_REGION
    )
    begin
      sqs.create_queue(queue_name: config.CONSUME_FOOD_QUEUE)
      sqs.create_queue(queue_name: config.CLEAR_POSTS_QUEUE)
      puts 'Queues created'
    rescue => e
      puts "Error creating queues: #{e}"
    end
  end
end
