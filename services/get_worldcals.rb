# frozen_string_literal: true

# Loads data from Facebook group to database
class GetWorldCals
  extend Dry::Monads::Either::Mixin

  def self.call

    if (food=Food.all).nil?
      Left(Error.new(:not_found, 'Error in GetWorldCals'))
    else
      total = 0
      food.each{|a|
      total = total + a.nf_calories.to_i * a.tag_amount}
      Right(total)
    end
  end
end
