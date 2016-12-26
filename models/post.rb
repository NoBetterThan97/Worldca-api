# frozen_string_literal: true

# Represents a Tweet's information
class Post < Sequel::Model
  many_to_many :foods
end
