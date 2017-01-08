# frozen_string_literal: true
class ConsumeFoodJob
  include Shoryuken::Worker
  shoryuken_options queue: BackgroundWorker.config.CONSUME_FOOD_QUEUE, auto_delete: true

  def perform(_sqs_msg, body)
    ConsumeFoodService.call(body)
  end
end
