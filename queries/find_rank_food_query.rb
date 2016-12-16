# frozen_string_literal: true

# Search query for postings in a group by optional keywords
class FindRankFoodQuery
  def self.call(criteria)
    if criteria[:degree]
      Popularity.reverse_order(:tag_amount).limit(criteria[:count]).all
    else
      Popularity.order(:tag_amount).limit(criteria[:count]).all
    end
  end
end
