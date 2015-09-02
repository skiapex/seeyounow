class PatientsController < ApplicationController
  skip_before_action :require_clinician
  skip_before_action :require_admin

  def index
    # @patients = Patient.all
    @patients = current_clinician.patients.order("first_name asc")
    @esas_assessments = current_clinician.esas_assessments.order("created_at desc")
    @shared = Patient.where(shared_with: "{#{current_clinician.id}}").order("first_name asc")
  end

  def show
    @patient = Patient.find_by(id: params["id"])
    @clinician = Clinician.find_by(id: params["id"])

    @age = Date.today.year - @patient.birth_date.year
    @age -= 1 if Date.today < @patient.birth_date + @age.years #for days before birthday

    @esas_assessments = EsasAssessment.where(patient_id: @patient.id).order("created_at desc")
    @prfs_assessments = PrfsAssessment.where(patient_id: @patient.id).order("created_at desc")
    @comments = Comment.where(patient_id: @patient.id).order("created_at desc")
    @notes = Note.where(patient_id: @patient.id).order("created_at desc")
    @care_givers = CareGiver.where(patient_id: @patient.id).order("first_name asc")

    @notifications = @esas_assessments + @prfs_assessments + @comments
    
    @gender = @patient.gender
    @care_group = @patient.care_group
    @shared = @patient.care_group_assignments

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @laminate }
  end
  end

  def new
    @patient = Patient.new
    @user = User.new
    @patient.build_user

    @care_group = current_clinician.care_group
  end

  def create
    @patient = Patient.create(patient_params)
    @patient.other_symptom = nil
    @patient.care_group = current_clinician.care_group

    if @patient.save
      redirect_to patient_path(@patient), notice: "New patient created!"
    else
      render "new"
    end
  end

  def edit
		@patient = Patient.find_by(id: params["id"])
    @care_group = @patient.care_group
	end

	def update
    @patient = Patient.find_by(id: params["id"])
    @patient.update_attributes(patient_params)
    if @patient.valid?
      redirect_to patient_path(@patient), notice: "Patient details updated!"
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
      params.require(:patient).permit(:clinician_ids,:first_name,:last_name,:user_id,:diagnosis,:diagnosis_date,:gender_id,:birth_date,:address,:phone_number,:other_symptom,:goals_of_care,:important_to_you,:shared_with,:care_group_id,:patient_deceased,:patient_archived, user_attributes: [ :email, :password, :patient_id, :clinician_id ])
    end

end