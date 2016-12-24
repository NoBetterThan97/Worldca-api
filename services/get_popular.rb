# frozen_string_literal: true

# Loads data from Facebook group to database
class GetPopular
  extend Dry::Monads::Either::Mixin

  def self.call(criteria)
    popular = FindRankFoodQuery.call(criteria)

    if popular.nil?
      Left(Error.new(:not_found, 'Error in GetLessPopular'))
    else
      Right(Foods.new(popular))
    end
  end
end
