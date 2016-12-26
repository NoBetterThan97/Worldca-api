# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    create_table(:posts) do
      primary_key :id

      String :text
      String :url
      String :image_url
      Timestamp :created_at
    end
  end
end
