# frozen_string_literal: true
require 'json'
require 'econfig'
require 'httparty'

module WebsocketChannelPublication
  extend Econfig::Shortcut

  Econfig.env = ENV['RACK_ENV'] || 'development'
  Econfig.root = File.expand_path('..', File.dirname(__FILE__))

  def publish(channel:, data:)
    HTTParty.post(
      WebsocketChannelPublication.config.WS_SERVER_URL,
      body: { channel: "/#{channel}", data: data }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end
