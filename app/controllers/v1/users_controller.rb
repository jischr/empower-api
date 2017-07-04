require 'json_web_token'

class V1::UsersController < ApplicationController

  before_action :authenticate_request, :except => [:create]

  def show
    @user = User.find(params[:id]).as_json(include: {alternatives: {only: [:id, :text]}}, except: :password_digest)
    render json: @user
  end

  def showscores
    @user = User.find_by_patient_number(params[:id]).as_json(include: {scores: {only: [:score_value, :updated_at]}})
    render json: @user
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password]

    if @user.save
      render json: @user
    else
      render json: {errors: @user.errors.messages}, status: :unprocessable_entity
    end
  end

  def update
    if User.exists?(patient_number: params[:id])
      @user = User.find_by_patient_number(params[:id])
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Wrong Patient Number' }
    end
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :patient_number, :clinician_id, :password_digest, :phone_number, :sex, :education, :birth_date)
  end
end
