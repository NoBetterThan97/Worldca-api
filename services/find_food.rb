# frozen_string_literal: true
require 'foodnutritionix'

class FindFoodService
  extend Dry::Monads::Either::Mixin

  def self.call(name:, create_if_missing: false)
    result = Food.find(name: name)
    result ||= create_food(name) if create_if_missing
    result.nil? ? Left(Error.new(Error::Status::NOT_FOUND, 'Food not found')) : Right(result)
  end

  def self.create_food(food_name)
    foods = FoodNutritionix::Food.search(food_name)
    return nil if foods.empty?
    Food.create(create_food_params(foods.first))
  end

  def self.create_food_params(food)
    food.to_hash
        .tap { |h| h.delete(:photo) }
        .merge(image_url: food.photo['highres'])
  end
end
