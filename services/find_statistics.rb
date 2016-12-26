class FindFoodStatisticsService
  def self.call(limit: nil)
    Statistics.new(
      Food.with_sql(query_statement(limit: limit))
          .map { |food| Statistic.new(food, food.posts.count) }
    )
  end

  def self.query_statement(limit: nil)
    %{
      SELECT foods.*
      FROM foods
      INNER JOIN foods_posts
      ON (foods_posts.food_id = foods.id)
      GROUP BY foods.id
      ORDER BY COUNT(foods_posts.post_id) DESC
    } + (limit ? "LIMIT #{limit}" : '')
  end
end
