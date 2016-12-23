# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    create_table(:foods) do
      primary_key :id

      String :name
      String :serving_quantity
      String :serving_unit
      String :serving_weight # in grams
      String :calories
      String :fat
      String :saturated_fat
      String :cholesterol
      String :sodium
      String :carbohydrate
      String :dietary_fiber
      String :sugars
      String :protein
      String :potassium
      String :image_url
    end
  end
end
