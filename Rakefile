# frozen_string_literal: true
require 'rake/testtask'

task :default do
  puts `rake -T`
end

Rake::TestTask.new(:spec) do |t|
  t.pattern = 'spec/*_spec.rb'
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
    require 'csv'
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

  desc 'Import dictionary into db'
  task import: [:_setup] do
    csv = CSV.parse File.read('db/import/food_index.csv').encode('UTF-8', invalid: :replace), headers: true
    csv.each do |line|
      record = Food.create(food_name: line['name'] )
    end
  end

end
