# frozen_string_literal: true
class FindStatisticService
  extend Dry::Monads::Either::Mixin
  def self.call(name:)
    result = FindFoodService.call(name: name)
    if result.success?
      food = result.value
      Right(Statistic.new(food, food.posts.count))
    else
      Left(Error.new(Error::Status::NOT_FOUND, "Cannot find food: #{name}"))
    end
  end
end
