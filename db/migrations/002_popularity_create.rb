# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    create_table(:foods) do
      primary_key :id
      foreign_key :food_id
      String :food_name
    end
  end
end
