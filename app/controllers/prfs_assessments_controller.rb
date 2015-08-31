class PrfsAssessmentsController < ApplicationController
  skip_before_action :require_clinician, only: [:new, :create, :show, :edit, :update]
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
    @care_giver = @prfs_assessment.care_giver
  end

  def new
    @prfs_assessment = PrfsAssessment.new
    @select_options = {'normal with no limitations' => ['0'], 'not my normal self, but able to be up and about with fairly normal activities' => ['1'], 'not feeling up to most things, but in bed or chair less than half the day' => ['2'], 'able to do little activity & spend most of the day in bed or chair' => ['3'], 'pretty much bedridden, rarely out of bed' => ['4']}
  end

  def create
    @prfs_assessment = PrfsAssessment.new(prfs_assessment_params)
    if current_clinician
      @prfs_assessment.clinician = current_clinician
      @prfs_assessment.clinician_completed = true
    else
      @prfs_assessment.patient = current_user.patient
      @prfs_assessment.clinician = current_user.patient.clinician
      @prfs_assessment.clinician_completed = false
    end
    if @prfs_assessment.save
      if current_clinician
        redirect_to prfs_assessments_path, notice: "PRFS assessment submitted!"
      else
        redirect_to prfs_assessment_path(@prfs_assessment), notice: "PRFS assessment submitted!"
      end
    else
      render "new", alert: "PRFS assessment not submitted!"
    end
  end

  def edit
    @prfs_assessment = PrfsAssessment.find_by(id: params["id"])
    @select_options = {'normal with no limitations' => ['0'], 'not my normal self, but able to be up and about with fairly normal activities' => ['1'], 'not feeling up to most things, but in bed or chair less than half the day' => ['2'], 'able to do little activity & spend most of the day in bed or chair' => ['3'], 'pretty much bedridden, rarely out of bed' => ['4']}
  end

  def update
    @prfs_assessment = PrfsAssessment.find_by(id: params["id"])
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

  private
    def prfs_assessment_params
      params.require(:prfs_assessment).permit(:patient_id, :clinician_id,:clinician_completed, :created_at, :updated_at, :care_giver_id, :activity_and_function, :prfs_comment)
    end

end