class PatientsController < ApplicationController
  skip_before_action :require_clinician
  skip_before_action :require_admin

  def index
    # @patients = Patient.all
    @patients = current_clinician.patients.order("first_name asc")
    @esas_assessments = current_clinician.esas_assessments.order("created_at desc")
  end

  def show
    @patient = Patient.find_by(id: params["id"])
    @esas_assessments = EsasAssessment.where(patient_id: @patient.id).order("created_at desc")
    @prfs_assessments = PrfsAssessment.where(patient_id: @patient.id).order("created_at desc")
    @comments = Comment.where(patient_id: @patient.id).order("created_at desc")
    @notes = Note.where(patient_id: @patient.id).order("created_at desc")

    @notifications = @esas_assessments + @prfs_assessments + @comments
    
    @gender = @patient.gender
    @clinician = @patient.clinician
    @occupation = @clinician.occupation
  end

  def new
    @patient = Patient.new
    @user = User.new
    @patient.build_user
  end

  def create
    @patient = Patient.create(patient_params)
    @patient.clinician = current_user.clinician

    if @patient.save
      redirect_to patient_path(@patient), notice: "New patient created!"
    else
      render "new"
    end
  end

  def edit
		@patient = Patient.find_by(id: params["id"])
	end

	def update
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

  private

    def patient_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:patient).permit( :first_name,:last_name,:user_id,:diagnosis,:diagnosis_date,:gender_id,:age,:address,:phone_number,:caregiver_name,:other_symptom,:goals_of_care,:important_to_you,:shared_with,:patient_deceased,:patient_archived, user_attributes: [ :email, :password, :patient_id, :clinician_id ])
    end

end