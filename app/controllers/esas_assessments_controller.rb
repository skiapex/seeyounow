class EsasAssessmentsController < ApplicationController
  skip_before_action :require_clinician, only: [:new, :create, :show, :edit, :update]
  skip_before_action :require_admin

  def index
    if current_clinician
      @esas_assessments = current_clinician.esas_assessments
    else
      @esas_assessments = Patient.find_by(user_id: current_user.id).esas_assessments.order("created_at desc")
    end
  end

  def show
    @esas_assessment = EsasAssessment.find_by(id: params["id"])
    @care_giver = @esas_assessment.care_giver

    if current_clinician
      if @esas_assessment.patient.clinicians.include?(current_clinician)
      else
        redirect_to root_path, notice: "You tried to access information you do not have authorization for"
      end
    else
      if @esas_assessment.patient.id == current_user.patient.id
      else
        redirect_to root_path, notice: "You tried to access information you do not have authorization for"
      end
    end
  end

  def new
    @esas_assessment = EsasAssessment.new
    @no_other_symptom = OtherSymptom.find_by(symptom_type: 'none').id
    @patient = Patient.find_by(user_id: current_user.id)
  end

  def create
    @esas_assessment = EsasAssessment.new(esas_assessment_params)
    if current_clinician
      @esas_assessment.clinician = current_clinician
      @esas_assessment.clinician_completed = true
    else
      @esas_assessment.patient = current_user.patient
      @esas_assessment.clinician = current_user.patient.clinicians.first
      @esas_assessment.clinician_completed = false
    end
    
    if @esas_assessment.save
      if current_clinician
        redirect_to esas_assessments_path, notice: "ESAS assessment submitted!"
      else
        redirect_to esas_assessment_path(@esas_assessment), notice: "ESAS assessment submitted!"
      end
    else
      render "new", alert: "ESAS assessment not submitted!"
    end
  end

  def edit
    @esas_assessment = EsasAssessment.find_by(id: params["id"])
    @other_symptom = OtherSymptom.find_by(symptom_type: '@esas_assessment.other_symptom_id')
    if current_clinician
      @resolved_by = {current_clinician.full_name => [current_clinician.id], 'none' => ['nil']}
    end
  end

  def update
    @esas_assessment = EsasAssessment.find_by(id: params["id"])
    @esas_assessment.update_attributes(esas_assessment_params)
    if @esas_assessment.valid?
      redirect_to esas_assessment_path(@esas_assessment), notice: "ESAS assessment edited!"
    else
      render "edit", alert: "ESAS assessment not edited!"
    end
  end

  def destroy
    @esas_assessment = EsasAssessment.find_by(id: params["id"])
    @esas_assessment.destroy

    redirect_to esas_assessments_path, notice: "ESAS assessment deleted!"
  end

  private
    def esas_assessment_params
      params.require(:esas_assessment).permit(:patient_id, :clinician_id,:clinician_completed, :created_at, :updated_at, :care_giver_id, :pain, :pain_comment, :tiredness, :tiredness_comment, :drowsiness, :drowsiness_comment, :nausea, :nausea_comment, :lack_of_appetite, :lack_of_appetite_comment, :shortness_of_breath, :shortness_of_breath_comment, :depression, :depression_comment, :anxiety, :anxiety_comment, :wellbeing, :wellbeing_comment, :other_symptom_id, :other_symptom_score, :other_symptom_comment, :esas_comment, :resolution, :priority_resolved, :resolved_by )
    end

end