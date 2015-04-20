class PrfsAssessmentsController < ApplicationController
  skip_before_action :require_clinician, only: [:new, :show]

  def index
    if current_clinician
      @prfs_assessments = current_clinician.prfs_assessments
    else
      @prfs_assessments = Patient.find_by(user_id: User.find_by(id: current_user)).prfs_assessments.order("created_at desc")
    end
  end

  def show
    @prfs_assessment = PrfsAssessment.find_by(id: params["id"])
  end

  def new
    @prfs_assessment = PrfsAssessment.new
  end

  def create
    prfs_assessment_params = params.require(:prfs_assessment).permit(:patient_id, :clinician_id, :time, :year, :month, :day, :inputter_name, :inputter_id, :pain, :pain_comment, :tiredness, :tiredness_comment, :drowsiness, :drowsiness_comment, :nausea, :nausea_comment, :lack_of_appetite, :lack_of_appetite_comment, :shortness_of_breath, :shortness_of_breath_comment, :depression, :depression_comment, :wellbeing, :wellbeing_comment, :other_symptom_id, :other_symptom_score, :other_symptom_comment, :prfs_comment)
    @prfs_assessment = PrfsAssessment.new(prfs_assessment_params)
    if current_clinician
      @prfs_assessment.clinician = current_user.clinician
    else
      @prfs_assessment.patient = current_user.patient
      @prfs_assessment.clinician = current_user.patient.clinician
    end
    if @prfs_assessment.save
      redirect_to prfs_assessments_path, notice: "ESAS assessment submitted!"
    else
      render "new", alert: "ESAS assessment not submitted!"
    end
  end

  def edit
    @prfs_assessment = PrfsAssessment.find_by(id: params["id"])
  end

  def update
    prfs_assessment_params = params.require(:prfs_assessment).permit!
    find_prfs_assessment
    @prfs_assessment.update_attributes(prfs_assessment_params)
    if @prfs_assessment.valid?
      redirect_to prfs_assessment_path(@prfs_assessment), notice: "ESAS assessment edited!"
    else
      render "edit", alert: "ESAS assessment not edited!"
    end
  end

  def destroy
    find_prfs_assessment
    @prfs_assessment.destroy
    redirect_to prfs_assessments_path, notice: "ESAS assessment deleted!"
  end

end