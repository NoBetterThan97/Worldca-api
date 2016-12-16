# frozen_string_literal: true

# Input for SearchPostings
class RankMaterial

  attr_accessor :photo, :food_id, :name, :tag_amount, :rank

  def initialize(params)
    @photo = params[:photo]
    @food_id = params[:food_id]
    @name = params[:name]
    @tag_amount = params[:tag_amount]
    @rank = params[:rank]

  end
end
