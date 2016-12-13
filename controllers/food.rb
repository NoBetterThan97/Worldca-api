# frozen_string_literal: true

# GroupAPI web service
class WorldCaAPI < Sinatra::Base
  #FB_GROUP_REGEX = %r{\"fb:\/\/group\/(\d+)\"}

  get "/#{API_VER}/food/nutrix/:id/?" do
    results = FindFoods.call
    Food_NutrixRepresenter.new(results.value).to_json
  end

  get "/#{API_VER}/food/:id/rank/?" do
    result = FindGroup.call(params)

    if result.success?
      GroupRepresenter.new(result.value).to_json
    else
      ErrorRepresenter.new(result.value).to_status_response
    end
  end

  get "/#{API_VER}/group/:id/news" do
    result = FindFbGroupUpdates.call(params)

    if result.success?
      PostingsSearchResultsRepresenter.new(result.value).to_json
    else
      ErrorRepresenter.new(result.value).to_status_response
    end
  end

  post "/#{API_VER}/group/?" do
    result = LoadGroupFromFB.call(request.body.read)

    if result.success?
      GroupRepresenter.new(result.value).to_json
    else
      ErrorRepresenter.new(result.value).to_status_response
    end
  end
end
