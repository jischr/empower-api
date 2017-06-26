class V1::UsersController < ApplicationController

  skip_before_action :authenticate_request

  def show
    @user = User.find(params[:id]).as_json(include: {alternatives: {only: [:id, :text]}}, except: :password_digest)
    puts @user
    render json: @user
  end

end
