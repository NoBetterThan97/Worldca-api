# frozen_string_literal: true

# Represents overall group information for JSON API output
class FoodRankRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :food_name
  property :photo
  property :tag_amount
end
