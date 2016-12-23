# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    # creates many-to-many relations between foods and tweets
    create_table(:foods_tweets) do
      Integer :food_id
      Integer :tweet_id
    end
  end
end
