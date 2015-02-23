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
    @gender = @patient.gender
  end

  def create
  	patient_params = params.require(:patient).permit!
    @patient = Patient.create(patient_params)
    if @patient.valid?
      redirect_to patients_path, notice: "New patient created!"
    else
      render "new"
    end
  end

  def edit
		@patient = Patient.find_by(id: params["id"])
	end

	def update
    patient_params = params.require(:patient).permit(:first_name,:last_name,:username,:diagnosis,:gender_id,:age,:address, :email, :password, :phone_number, :caregiver_name, :other_symptom, :goals_of_care, :patient_deceased, :patient_archived, :patient_deceased, :patient_archived)
    @patient = Patient.find_by(id: params["id"])
    @patient.update_attributes(patient_params)
    if @patient.valid?
      redirect_to patients_path, notice: "New patient created!"
    else
      render "edit"
    end
	end

  def destroy
    @patient = Patient.find_by(id: params["id"])
    @patient.destroy
    redirect_to patients_path
  end

end