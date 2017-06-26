class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def userAuthenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result, who: u }
    else
      render json: { error: command.errors }
    end
  end

  def clinicianAuthenticate
    command = AuthenticateClinician.call(params[:email], params[:password])
    if command.success?
      puts command.inspect
      render json: { auth_token: command.result, who: 'c' }
    else
      render json: { error: command.errors }
    end
  end
end
