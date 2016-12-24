# frozen_string_literal: true

# Represents a Tweet's information
class Tweet < Sequel::Model
  many_to_many :foods
end
