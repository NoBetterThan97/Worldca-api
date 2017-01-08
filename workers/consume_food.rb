# frozen_string_literal: true
class ConsumeFoodJob
  FoodNutritionix::FoodNutrixClient.config.update(
    x_app_id: BackgroundWorker.config.FOOD_APP_ID,
    x_app_key: BackgroundWorker.config.FOOD_APP_SECRET
  )

  include Shoryuken::Worker
  shoryuken_options queue: BackgroundWorker.config.CONSUME_FOOD_QUEUE, auto_delete: true

  include Base64Serialization

  def perform(_sqs_msg, body)
    ConsumeFoodService.call(base64_decode(body))
  rescue => e
    puts "Error consuming food: #{e}"
  end
end
