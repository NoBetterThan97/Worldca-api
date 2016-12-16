# frozen_string_literal: true

# Posting routes
class WorldCaAPI < Sinatra::Base

  get "/#{API_VER}/food/rank/low/:count"do
    criteria = RankCriteria.new(false,params[:count])
    results = GetPopular.call(criteria)

    if results.success?
      Food_RanksRepresenter.call(results.value)
    else
      ErrorRepresenter.new(results.value).to_status_response
    end
  end

  get "/#{API_VER}/food/rank/high/:count"do
    criteria = RankCriteria.new(true,params[:count])
    results = GetPopular.call(criteria)

    if results.success?
      Food_RanksRepresenter.call(results.value)
    else
      ErrorRepresenter.new(results.value).to_status_response
    end
  end
end
