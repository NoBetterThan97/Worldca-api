# frozen_string_literal: true

class WorldCaAPI < Sinatra::Base
  extend Econfig::Shortcut

  configure do
    Econfig.env = settings.environment.to_s
    Econfig.root = File.expand_path('..', settings.root)
    FoodNutritionix::FoodNutrixClient.config.update(x_app_id: config.FOOD_APP_ID,
                                                    x_app_key: config.FOOD_APP_SECRET)
  end

  after do
    content_type 'application/json'
  end

  error do
    content_type :json
    status 404 # or whatever

    e = env['sinatra.error']
    { message: e.message }.to_json
  end

  API_VER = 'api/v0.1'.freeze

  get '/?' do
    {
      status: 'OK',
      message: "WorldCaAPI latest version endpoints are at: /#{API_VER}/"
    }.to_json
  end
end
