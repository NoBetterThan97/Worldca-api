# frozen_string_literal: true
class WorldCaAPI < Sinatra::Base
  get "/#{API_VER}/foods" do
    StatisticsRepresenter.new(FindStatisticsService.call(limit: params['limit'])).to_json
  end

  get "/#{API_VER}/foods/:name" do
    result = FindStatisticService.call(name: params['name'])
    if result.success?
      StatisticRepresenter.new(result.value).to_json
    else
      ErrorRepresenter.new(result.value).to_json
    end
  end
end
