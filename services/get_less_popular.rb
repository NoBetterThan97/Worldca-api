# frozen_string_literal: true

# Loads data from Facebook group to database
class GetLessPopular
  extend Dry::Monads::Either::Mixin

  def self.call(criteria)
    if (popular = FindRankFoodQuery.call(criteria)).nil?
      Left(Error.new(:not_found, 'Error in GetLessPopular'))
    else
      Right(popular)
    end
  end
end
