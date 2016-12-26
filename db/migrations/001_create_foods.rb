# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    create_table(:foods) do
      primary_key :id

      String  :name
      String  :image_url

      Integer :serving_quantity
      String  :serving_unit
      Float   :serving_weight, default: 0.0 # in grams

      Float   :calories, default: 0.0
      Float   :fat, default: 0.0
      Float   :saturated_fat, default: 0.0
      Float   :cholesterol, default: 0.0
      Float   :sodium, default: 0.0
      Float   :carbohydrate, default: 0.0
      Float   :dietary_fiber, default: 0.0
      Float   :sugars, default: 0.0
      Float   :protein, default: 0.0
      Float   :potassium, default: 0.0
    end
  end
end
