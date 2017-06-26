class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def userAuthenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result, user_id: command.id, name: command.first_name }
    else
      render json: { error: command.errors }
    end
  end

  def clinicianAuthenticate
    command = AuthenticateClinician.call(params[:email], params[:password])
    if command.success?
      render json: { auth_token: command.result, clinician_id: command.id, name: command.first_name }
    else
      render json: { error: command.errors }
    end
  end
end
