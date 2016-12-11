# frozen_string_literal: true

# Represents a Food's stored information
class Food < Sequel::Model
  one_to_one :popularities
end
