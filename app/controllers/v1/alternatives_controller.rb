class V1::AlternativesController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @alternatives = Alternative.all
    render json: @alternatives
  end
end
