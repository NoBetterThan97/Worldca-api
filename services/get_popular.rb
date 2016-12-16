# frozen_string_literal: true

# Loads data from Facebook group to database
class GetPopular
  extend Dry::Monads::Either::Mixin

  def self.call(criteria)
    popular = FindRankFoodQuery.call(criteria)
    result = []
    for count in 0..popular.length-1
      foodrank = popular[count]
      food = Food.find(id: foodrank.food_id)
      result[count] = RankMaterial.new(photo:food.photo,food_id:food.id,name:food.food_name,tag_amount:foodrank.tag_amount,rank:count+1)
    end

    if (result).nil?
      Left(Error.new(:not_found, 'Error in GetLessPopular'))
    else
      Right(result)
    end
  end
end
