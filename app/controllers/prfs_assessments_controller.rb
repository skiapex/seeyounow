class PrfsAssessmentsController < ApplicationController
  skip_before_action :require_clinician, only: [:new, :show]
  skip_before_action :require_admin

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
    prfs_assessment_params = params.require(:prfs_assessment).permit!
    @prfs_assessment = PrfsAssessment.new(prfs_assessment_params)
    if current_clinician
      @prfs_assessment.clinician = current_user.clinician
      @prfs_assessment.inputter_name = current_user.clinician.full_name
      @prfs_assessment.inputter = Inputter.find_by(inputter_type: 'Medical team')
    else
      @prfs_assessment.patient = current_user.patient
      @prfs_assessment.clinician = current_user.patient.clinician
    end
    if @prfs_assessment.save
      redirect_to prfs_assessments_path, notice: "PRFS assessment submitted!"
    else
      render "new", alert: "PRFS assessment not submitted!"
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
      redirect_to prfs_assessment_path(@prfs_assessment), notice: "PRFS assessment edited!"
    else
      render "edit", alert: "PRFS assessment not edited!"
    end
  end

  def destroy
    find_prfs_assessment
    @prfs_assessment.destroy
    redirect_to prfs_assessments_path, notice: "PRFS assessment deleted!"
  end

end