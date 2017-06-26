class V1::UsersController < ApplicationController

  skip_before_action :authenticate_request

  def show
    @user = User.find(params[:id])
    render json: @user
  end

end
