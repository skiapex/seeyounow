class PatientsController < ApplicationController
  skip_before_action :require_clinician

  def index
    # @patients = Patient.all
    @patients = current_clinician.patients.order("first_name asc")
    @esas_assessments = current_clinician.esas_assessments.order("created_at desc")
  end

  def new
    @patient = Patient.new
  end

  def show
    @patient = Patient.find_by(id: params["id"])
    @esas_assessments = EsasAssessment.where(patient_id: @patient.id).order("created_at desc")
    
    @gender = @patient.gender
    @clinician = @patient.clinician
    @occupation = @clinician.occupation
  end

  def create
  	patient_params = params.require(:patient).permit!
    @patient = Patient.create(patient_params)
    if @patient.valid?
      redirect_to patient_path(@patient), notice: "New patient created!"
    else
      render "new"
    end
  end

  def edit
		@patient = Patient.find_by(id: params["id"])
	end

	def update
    patient_params = params.require(:patient).permit(:first_name,:last_name,:user_id,:diagnosis,:gender_id,:age,:address, :email, :password, :phone_number, :caregiver_name, :other_symptom, :goals_of_care, :patient_deceased, :patient_archived)
    @patient = Patient.find_by(id: params["id"])
    @patient.update_attributes(patient_params)
    if @patient.valid?
      redirect_to patient_path(@patient), notice: "New patient created!"
    else
      render "edit"
    end
	end

  def destroy
    @patient = Patient.find_by(id: params["id"])
    @patient.destroy
    redirect_to patients_path
  end

  def _patientfooter
    
  end

end