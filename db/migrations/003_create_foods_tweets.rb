# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    # creates many-to-many relations between foods and tweets
    create_table(:foods_tweets) do
      foreign_key :food_id, key: :id, :foods
      foreign_key :tweet_id, key: :id, :tweets
    end
  end
end
