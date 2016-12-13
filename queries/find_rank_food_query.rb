# frozen_string_literal: true

# Search query for postings in a group by optional keywords
class FindRankFoodQuery
  def self.call(RankCriteria)
    if RankCriteria.degree
      Popularity.order(:tag_amount).limit(RankCriteria.count).all
    else
      Popularity.reverse_order(:tag_amount).limit(RankCriteria.count).all
  end
end
