# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    create_table(:foods) do
      primary_key :id
      String :food_name
      DateTime :consumed_at
      String :serving_qty
      String :serving_unit
      String :serving_weight_grams
      String :nf_calories
      String :nf_total_fat
      String :nf_saturated_fat
      String :nf_cholesterol
      String :nf_sodium
      String :nf_total_carbohydrate
      String :nf_dietary_fiber
      String :nf_sugars
      String :nf_protein
      String :nf_potassium
      String :photo
    end
  end
end
