# frozen_string_literal: true
require 'foodnutritionix'

class FindFoodsService
  def self.call(names:)
    foods = names.map { |name| [name, Food.find(name: name)] }.to_h
    missing_foods = foods.select { |_, value| value.nil? }.keys
    foods.merge(create_foods(names: missing_foods)).select { |_, value| !value.nil? }.values
  end

  def self.create_foods(names:)
    return {} if names.empty?
    FoodNutritionix::Food.search(names)&.map do |food|
      [food.name, Food.create(create_food_params(food))]
    end.to_h || {}
  end

  def self.create_food_params(food)
    food.to_hash
        .tap { |h| h.delete(:photo) }
        .merge(image_url: food.photo['highres'])
  end
end
