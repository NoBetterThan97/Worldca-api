class FindFoodStatisticsService
  def self.call(limit: nil)
    Statistics.new(
      SortedFoodQuery.call(limit: limit)
                     .map { |food| Statistic.new(food, food.posts.count) }
    )
  end
end
