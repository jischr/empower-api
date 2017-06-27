require 'json_web_token'

class V1::UsersController < ApplicationController

  skip_before_action :authenticate_request, :includes => [:create]

  def show
    @user = User.find(params[:id]).as_json(include: {alternatives: {only: [:id, :text]}}, except: :password_digest)
    render json: @user
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password]

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :patient_number, :clinician_id, :password_digest, :phone_number)
  end
end
