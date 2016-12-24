require 'sequel'
require 'foodnutritionix'

results = Food.all
food_obj= results.map do |result|
  food = result.food_name
end

food_detail = food_obj.map do |i|
load_food = FoodNutritionix::Food.search(i)
Food.find(food_name: i).update(nf_calories: load_food.nf_calories,
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
photo: load_food.photo
 )
end

food_detail = food_obj.map do |i|
load_food = FoodNutritionix::Food.search(i)
load_food.to_h
Food.find(food_name: i).update(load_food)
end
