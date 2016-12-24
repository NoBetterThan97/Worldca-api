# frozen_string_literal: true
require_relative 'food_rank'

# Represents overall group information for JSON API output
class FoodRanksRepresenter < Roar::Decorator
  include Roar::JSON

  collection :foods, extend: FoodRankRepresenter, class: Food
end
