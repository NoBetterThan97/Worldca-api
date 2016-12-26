require 'concurrent'

class ConsumeFoodService
  extend Dry::Monads::Either::Mixin
  extend Dry::Container::Mixin

  def self.call(request_payload, websocket_server_url: nil)
    params = {
      request_payload: request_payload,
      websocket_server_url: websocket_server_url
    }

    Dry.Transaction(container: self) do
      step :validate_payload
      step :save_post
      step :process_foods
      step :delete_post_if_necessary
    end.call(params)
  end

  register(:validate_payload, lambda do |params|
    post_params = NewPostRepresenter.new(NewPost.new)
                                    .from_json(params[:request_payload])
                                    .to_h
    if post_params[:text].nil? || post_params[:url].nil? || post_params[:created_at].nil? ||
       post_params[:image_url].nil? || post_params[:hashtags].nil?
      Left(Error.new('Incorrect parameters'))
    else
      Right(params.merge(post_params))
    end
  end)

  register(:save_post, lambda do |params|
    post = Post.new(
      [:text, :url, :image_url, :created_at].map { |key| [key, params[key]] }.to_h
    )

    if post.save
      params[:post] = post
      Right(params)
    else
      Left(Error.new('Cannot save post'))
    end
  end)

  register(:process_foods, lambda do |params|
    post = params[:post]
    promises = params[:hashtags].map do |tag|
      Concurrent::Promise.execute { FindFoodService.call(name: tag, create_if_missing: true) }
    end
    promises.each { |result| post.add_food(result.value.value) if result.value.success? }
    Right(post)
  end)

  register(:delete_post_if_necessary, lambda do |post|
    post.destroy if post.foods.count.zero?
    Right('Processed!')
  end)
end
