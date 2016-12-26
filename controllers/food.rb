# frozen_string_literal: true
class WorldCaAPI < Sinatra::Base
  get "/#{API_VER}/foods" do
    StatisticsRepresenter.new(FindFoodStatisticsService.call(limit: params['limit'])).to_json
  end

  get "/#{API_VER}/foods/:name" do
    FoodRepresenter.new(FindFoodService.call(name: params['name']).value).to_json
  end
end
