class V1::ScoresController < ApplicationController

  skip_before_action :authenticate_request

  def index
  end

  def show
  end

  def create
    @score = Score.new(score_params)

    if @score.save
      render json: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def score_params
    params.require(:score).permit(:score_value, :user_id, :measure_id)
  end
end
