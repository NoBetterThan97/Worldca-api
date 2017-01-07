# frozen_string_literal: true
require_relative 'food'

class StatisticRepresenter < Roar::Decorator
  include Roar::JSON

  property :food, extend: FoodRepresenter, class: Food
  property :consumptions
end
