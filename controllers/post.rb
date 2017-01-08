# frozen_string_literal: true
class WorldCaAPI < Sinatra::Base
  post "/#{API_VER}/posts" do
    ConsumeFoodJob.perform_async(request.body.read)
    status 202
  end

  delete "/#{API_VER}/posts" do
    ClearPostsJob.perform_async(Time.now.to_s)
    status 202
  end
end
