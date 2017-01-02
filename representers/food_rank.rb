# frozen_string_literal: true

# Represents overall group information for JSON API output
class FoodRankRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :name
  property :image_url
  property :tag_amount
end
