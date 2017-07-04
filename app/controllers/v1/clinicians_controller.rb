require 'json_web_token'

class V1::CliniciansController < ApplicationController

  before_action :authenticate_request, :except => [:create]

  def show
    @clinician = Clinician.find(params[:id]).as_json(include: {users: {only: [:first_name, :last_name, :patient_number]}},except: :password_digest)
    render json: @clinician
  end

  def create
    @clinician = Clinician.new(clinician_params)
    @clinician.password = params[:password]

    if @clinician.save
      render json: @clinician
    else
      render json: @clinician.errors, status: :unprocessable_entity
    end
  end

  private

  def clinician_params
    params.require(:clinician).permit(:first_name, :last_name, :email, :patient_number, :clinician_id, :password_digest, :phone_number)
  end
end
