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
    food = FoodNutritionix::Food.search(food_name)
    Food.create(create_food_params(food))
  rescue
    nil
  end

  def self.create_food_params(food)
    {
      name: food.food_name,
      serving_quantity: food.serving_qty,
      serving_unit: food.serving_unit,
      serving_weight: food.serving_weight_grams,
      calories: food.nf_calories,
      fat: food.nf_total_fat,
      saturated_fat: food.nf_saturated_fat,
      cholesterol: food.nf_cholesterol,
      sodium: food.nf_sodium,
      carbohydrate: food.nf_total_carbohydrate,
      dietary_fiber: food.nf_dietary_fiber,
      sugars: food.nf_sugars,
      protein: food.nf_protein,
      potassium: food.nf_potassium,
      image_url: food.photo['highres']
    }
  end
end
