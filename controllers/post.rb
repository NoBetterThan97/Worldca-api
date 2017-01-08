# frozen_string_literal: true
class WorldCaAPI < Sinatra::Base
  post "/#{API_VER}/posts" do
    ConsumeFoodService.call(request.body.read)
    status 202
  end

  delete "/#{API_VER}/posts" do
    ClearPostsService.call
    status 202
  end
end
