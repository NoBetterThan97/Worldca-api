# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    create_table(:popularities) do
      primary_key :id
      foreign_key :food_id
      Integer :tag_amount
    end
  end
end
