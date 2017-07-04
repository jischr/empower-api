class V1::AlternativesController < ApplicationController
  before_action :authenticate_request

  def show
    @alternatives = User.find(params[:id]).alternatives.as_json(only: [:text, :id])
    render json: @alternatives
  end

  def create
    @alternative = Alternative.new(alternative_params)
    if @alternative.save
      render json: @alternative
    else
      render :status => 400
    end
  end

  def destroy
     @alternative = Alternative.find params[:id]
     @alternative.destroy
     render :status
  end

  private

  def alternative_params
    params.require(:alternative).permit(:text, :user_id)
  end
end
