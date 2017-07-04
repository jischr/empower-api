class V1::ScoresController < ApplicationController

  before_action :authenticate_request

  def create
    @score = Score.new(score_params)

    if @score.save
      render json: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  private

  def score_params
    params.require(:score).permit(:score_value, :user_id, :measure_id)
  end
end
