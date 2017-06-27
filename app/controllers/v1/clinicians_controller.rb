require 'json_web_token'

class V1::CliniciansController < ApplicationController

  skip_before_action :authenticate_request, :includes => [:create]

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

  def update
    @clinician = Clinician.find(params[:id])
    if @clinician.update(clinician_params)
      render json: @clinician
    else
      render json: @clinician.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @clinician = Clinician.find(params[:id])
    @clinician.delete
  end

  private

  def clinician_params
    params.require(:clinician).permit(:first_name, :last_name, :email, :patient_number, :clinician_id, :password_digest, :phone_number)
  end
end
