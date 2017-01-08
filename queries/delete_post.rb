# frozen_string_literal: true
class DeletePostQuery
  def self.call(id:)
    delete_associations(id: id)
    Post.find(id: id).delete
  end

  # sorts foods by number of associated posts
  def self.delete_associations(id:)
    Post.with_sql("DELETE FROM foods_posts WHERE post_id = #{id}").all
  end
end
