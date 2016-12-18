# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    create_table(:tweets) do
      primary_key :id

      String :text
      String :url
      String :image_url
      Datetime :created_at
    end
  end
end
