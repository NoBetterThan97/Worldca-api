# frozen_string_literal: true
class SortedFoodQuery
  def self.call(limit: nil)
    Food.with_sql(query_statement(limit: limit))
  end

  # sorts foods by number of associated posts
  def self.query_statement(limit: nil)
    %{
      SELECT foods.*
      FROM foods
      INNER JOIN foods_posts
      ON (foods_posts.food_id = foods.id)
      GROUP BY foods.id
      ORDER BY COUNT(foods_posts.post_id) * foods.calories::float DESC
    } + (limit ? "LIMIT #{limit}" : '')
  end
end
