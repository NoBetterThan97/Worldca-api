# frozen_string_literal: true
class FindFoodService
  extend Dry::Monads::Either::Mixin

  def self.call(name:)
    result = Food.find(name: name)
    result.nil? ? Left(Error.new(Error::Status::NOT_FOUND, 'Food not found')) : Right(result)
  end
end
