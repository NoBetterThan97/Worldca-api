# frozen_string_literal: true

# Loads data from Facebook group to database
class GetMostPopular
  extend Dry::Monads::Either::Mixin

  def self.call(criteria)
    if (popular = FindRankFoodQuery.call(criteria)).nil?
      Left(Error.new(:not_found, 'Error in GetMostPopular'))
    else
      Right(popular)
    end
  end
end
