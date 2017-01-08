# frozen_string_literal: true
class ClearPostsService
  def self.call
    Post.map(&:id).each { |post_id| DeletePostQuery.call(id: post_id) }
  end
end
