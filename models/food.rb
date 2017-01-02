# frozen_string_literal: true

# Represents a Food's stored information
class Food < Sequel::Model
  many_to_many :tweets
end
