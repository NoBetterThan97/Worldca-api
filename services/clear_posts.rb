# frozen_string_literal: true
class ClearPostsService
  def self.call
    Post.all.each(&:delete)
  end
end
