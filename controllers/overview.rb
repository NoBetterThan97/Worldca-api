# frozen_string_literal: true
class WorldCaAPI < Sinatra::Base
  get "/#{API_VER}/overview" do
    OverviewRepresenter.new(ComputeOverviewService.call).to_json
  end
end
