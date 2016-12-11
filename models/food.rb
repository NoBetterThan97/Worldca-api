# frozen_string_literal: true

# Represents a Group's stored information
class Food < Sequel::Model
  one_to_one :popularity
end
