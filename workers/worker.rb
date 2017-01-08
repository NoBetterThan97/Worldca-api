# frozen_string_literal: true
require 'econfig'
require 'shoryuken'

folders = 'lib,values,config,models,representers,queries,services'
Dir.glob("./{#{folders}}/init.rb").each do |file|
  require file
end

class BackgroundWorker
  extend Econfig::Shortcut
  Econfig.env = ENV['RACK_ENV'] || 'development'
  Econfig.root = File.expand_path('..', File.dirname(__FILE__))

  Shoryuken.aws = {
    access_key_id: config.AWS_ACCESS_KEY_ID,
    secret_access_key: config.AWS_SECRET_ACCESS_KEY,
    region: config.AWS_REGION
  }
end

require_relative 'clear_posts'
require_relative 'consume_food'
