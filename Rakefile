# frozen_string_literal: true
require 'rake/testtask'
require 'byebug'

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

task :run do
  sh 'rerun "rackup -p 9292"'
end

namespace :db do
  task :_setup do
    require 'sequel'
    require 'foodnutritionix'
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



  desc 'Import info from API'
  task getinfo: [:_setup] do
    results = Food.all
    food_obj= results.map do |result|
      food = result.food_name
    end

    food_detail = food_obj.map do |i|
      load_food = FoodNutritionix::Food.search(i)

  Food.find(food_name: i).update(
	nf_calories: load_food.nf_calories,
	nf_total_fat: load_food.nf_total_fat,
	consumed_at: load_food.consumed_at,
	serving_qty: load_food.serving_qty,
	serving_unit: load_food.serving_unit,
	serving_weight_grams: load_food.serving_weight_grams,
	nf_calories: load_food.nf_calories,
	nf_total_fat: load_food.nf_total_fat,
	nf_saturated_fat: load_food.nf_saturated_fat,
	nf_cholesterol: load_food.nf_cholesterol,
	nf_sodium: load_food.nf_sodium,
	nf_total_carbohydrate: load_food.nf_total_carbohydrate,
	nf_dietary_fiber: load_food.nf_dietary_fiber,
	nf_sugars: load_food.nf_sugars,
	nf_protein: load_food.nf_protein,
	nf_potassium: load_food.nf_potassium,
	photo: load_food.photo['thumb']
      )
    end
  end

end
