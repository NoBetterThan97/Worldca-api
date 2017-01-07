# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    # creates many-to-many relations between foods and tweets
    create_table(:foods_posts) do
      Integer :food_id
      Integer :post_id
    end
  end
end
