# frozen_string_literal: true

# GroupAPI web service
class WorldCaAPI < Sinatra::Base

  get "/#{API_VER}/food/nutrix/:name/?" do
    results = GetNutrix.call(params)

    if results.success?
      Food_NutrixRepresenter.new(results.value).to_json
    else
      ErrorRepresenter.new(results.value).to_status_response
    end
  end

  post "/#{API_VER}/food/nutrix/:name/?" do
    result = LoadFoodFromNutrix.call(request.body.read)

    if result.success?
      content_type 'text/plain'
      body result.value
    else
      ErrorRepresenter.new(result.value).to_status_response
    end
  end
end
