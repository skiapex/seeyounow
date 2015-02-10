class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def show
    @patient = Patient.find_by(id: params["id"])
    @esas_assesments = EsasAssesment.where(patient_id: @patient.id)
  end

  def create
  	patient_params = params.require(:patient).permit(:first_name,:last_name,:username,:diagnosis,:gender,:age,:address, :email, :password, :phone_number, :caregiver_name, :other_sypmtom, :goals_of_care, :patient_deceased, :patient_archived)
    Patient.create(patient_params)
    #render text: params["patient"]
    redirect_to patients_path
  end

  def edit
		@patient = Patient.find_by(id: params["id"])
	end

	def update
    patient_params = params.require(:patient).permit(:first_name,:last_name,:username,:diagnosis,:gender,:age,:address, :email, :password, :phone_number, :caregiver_name, :other_sypmtom, :goals_of_care, :patient_deceased, :patient_archived)
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