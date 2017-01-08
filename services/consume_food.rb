# frozen_string_literal: true
require 'concurrent'

class ConsumeFoodService
  extend Dry::Monads::Either::Mixin
  extend Dry::Container::Mixin
  extend WebsocketChannelPublication

  def self.call(request_payload, websocket_server_url: nil)
    params = {
      request_payload: request_payload,
      websocket_server_url: websocket_server_url
    }

    Dry.Transaction(container: self) do
      step :validate_payload
      step :create_post
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
      Left(Error.new(Error::Status::BAD_REQUEST, 'Incorrect parameters'))
    else
      Right(params.merge(post_params))
    end
  end)

  register(:create_post, lambda do |params|
    post = Post.new(
      [:text, :url, :image_url, :created_at].map { |key| [key, params[key]] }.to_h
    )

    if post.save
      params[:post] = post
      Right(params)
    else
      Left(Error.new(Error::Status::BAD_REQUEST, 'Cannot save post'))
    end
  end)

  register(:process_foods, lambda do |params|
    post = params[:post]
    FindFoodsService.call(names: params[:hashtags]).each do |food|
      post.add_food(food)
      publish_consumed_event(food, post)
    end
    Right(post)
  end)

  register(:delete_post_if_necessary, lambda do |post|
    post.destroy if post.foods.count.zero?
    Right('Processed!')
  end)

  def self.publish_consumed_event(food, post)
    publish(
      channel: food.name,
      data: PostRepresenter.new(post).to_json
    )
    publish(
      channel: 'overview',
      data: food.calories
    )
  end
end
