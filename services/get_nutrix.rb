# frozen_string_literal: true

class GetNutrix
  extend Dry::Monads::Either::Mixin

  def self.call(params)
    result = Food.first(name: params[:name])

    if result.nil?
      Left(Error.new(:not_found, 'Error in GetNutrix'))
    else
      Right(result)
    end
  end
end
