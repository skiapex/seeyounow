class PatientsController < ApplicationController
  skip_before_action :require_clinician, only: [:show,:new,:update,:edit,:create]
  skip_before_action :require_admin

  def index
    @patients = current_clinician.patients.order("first_name asc")
    @esas_assessments = current_clinician.esas_assessments.order("created_at desc")
    @shared = current_clinician.care_group_assignments
  end

    def show
      puts params.inspect
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

      if current_clinician
        if @patient.clinicians.include?(current_clinician)
        else
          redirect_to patients_path, notice: "You tried to access information you do not have authorization for"
        end
      else
        if @patient.id == current_user.patient.id
        else
          redirect_to root_path, notice: "You tried to access information you do not have authorization for"
        end
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
      if @patient.notification_level == nil
        @patient.notification_level = 8
      end
      @patient.care_group = current_clinician.care_group

      if @patient.save
        logger.debug "New patient: #{@patient.care_group_assignments.inspect}"
        puts patient_params.inspect
        redirect_to patient_path(@patient), notice: "New patient created!"
      else
        render "new"
      end
    end

  def edit
		@patient = Patient.find_by(id: params["id"])
    @care_group = @patient.care_group

    if current_clinician
      if @patient.clinicians.include?(current_clinician)
      else
        redirect_to patients_path, notice: "You tried to access information you do not have authorization for"
      end
    else
      if @patient.id == current_user.patient.id
      else
        redirect_to root_path, notice: "You tried to access information you do not have authorization for"
      end
    end
	end

	def update
    @patient = Patient.find_by(id: params["id"])
    @patient.update_attributes(patient_params)
    if @patient.valid?
      puts params.inspect
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
        params.require(:patient).permit({:clinician_ids => []},:first_name,:last_name,:user_id,:diagnosis,:diagnosis_date,:gender_id,:birth_date,:address,:phone_number,:other_symptom,:goals_of_care,:important_to_you,:care_group_id,:patient_deceased,:patient_archived,:notification_level, user_attributes: [ :email, :password, :patient_id, :clinician_id, :terms_agreement ])
      end

end