# frozen_string_literal: true
class ClearPostsJob
  include Shoryuken::Worker
  shoryuken_options queue: BackgroundWorker.config.CLEAR_POSTS_QUEUE, auto_delete: true

  def perform(_sqs_msg, _body)
    ClearPostsService.call
  end
end
