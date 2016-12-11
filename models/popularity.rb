# frozen_string_literal: true

# Represents a Group's stored information
class Popularity < Sequel::Model
  one_to_one :foods
end
