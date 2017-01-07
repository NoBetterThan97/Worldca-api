# frozen_string_literal: true
require_relative 'post'

class FoodRepresenter < Roar::Decorator
  include Roar::JSON

  property :name
  property :serving_quantity
  property :serving_unit
  property :serving_weight # in grams
  property :calories
  property :fat
  property :saturated_fat
  property :cholesterol
  property :sodium
  property :carbohydrate
  property :dietary_fiber
  property :sugars
  property :protein
  property :potassium
  property :image_url

  collection :posts, extend: PostRepresenter, class: Post
end
