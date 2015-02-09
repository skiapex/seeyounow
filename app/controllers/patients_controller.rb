class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
  	patient_params = params.require(:patient).permit(:first_name)
  	Patient.create(patient_params)
    #render text: params["patient"]
    redirect_to patients_path
  end

  def edit
		@patient = Patient.find_by(id: params["id"])
	end

	def update
    patient_params = params.require(:patient).permit(:first_name)
    @patient = Patient.find_by(id: params["id"])
    @patient.update_attributes(patient_params)
    redirect_to patients_path
	end

  def destroy
    @patient = Patient.find_by(id: params["id"])
    @patient.destroy
    redirect_to patients_path
  end

end