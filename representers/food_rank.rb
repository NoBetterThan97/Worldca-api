# frozen_string_literal: true

# Represents overall group information for JSON API output
class Food_RankRepresenter < Roar::Decorator
  include Roar::JSON

  property :photo
  property :name
  property :tag_amount
  property :rank
end
