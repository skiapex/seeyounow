class EsasAssessmentsController < ApplicationController
  skip_before_action :require_clinician
  skip_before_action :require_admin

  def index
    if current_clinician
      @esas_assessments = current_clinician.esas_assessments
    else
      @esas_assessments = Patient.find_by(user_id: User.find_by(id: current_user)).esas_assessments.order("created_at desc")
    end
  end

  def show
    @esas_assessment = EsasAssessment.find_by(id: params["id"])
  end

  def new
    @esas_assessment = EsasAssessment.new
    @no_other_symptom = OtherSymptom.find_by(symptom_type: 'none').id
  end

  def create
    @esas_assessment = EsasAssessment.new(esas_assessment_params)
    if current_clinician
      @esas_assessment.clinician = current_user.clinician
      @esas_assessment.inputter_name = current_user.clinician.full_name
      @esas_assessment.inputter = Inputter.find_by(inputter_type: 'Medical team')
    else
      @esas_assessment.patient = current_user.patient
      @esas_assessment.clinician = current_user.patient.clinician
    end
    if @esas_assessment.save

      require 'statsmix'
      StatsMix.api_key = "9e744f92096e0902b113"
      StatsMix.track("ESAS submitted", 1)
      if StatsMix.error
        puts "Error: #{StatsMix.error}"
      end

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
  end

  def update
    @esas_assessment = EsasAssessment.find_by(id: params["id"])
    @esas_assessment.update_attributes(esas_assessment_params)
    if @esas_assessment.valid?

      require 'statsmix'
      StatsMix.api_key = "9e744f92096e0902b113"
      StatsMix.track("ESAS edited", 1)
      if StatsMix.error
        puts "Error: #{StatsMix.error}"
      end
      
      redirect_to esas_assessment_path(@esas_assessment), notice: "ESAS assessment edited!"
    else
      render "edit", alert: "ESAS assessment not edited!"
    end
  end

  def destroy
    @esas_assessment = EsasAssessment.find_by(id: params["id"])
    @esas_assessment.destroy

    require 'statsmix'
    StatsMix.api_key = "9e744f92096e0902b113"
    StatsMix.track("ESAS deleted", 1)
    if StatsMix.error
      puts "Error: #{StatsMix.error}"
    end

    redirect_to esas_assessments_path, notice: "ESAS assessment deleted!"
  end

  private
    def esas_assessment_params
      params.require(:esas_assessment).permit(:patient_id, :clinician_id, :time, :year, :month, :day, :inputter_name, :inputter_id, :pain, :pain_comment, :tiredness, :tiredness_comment, :drowsiness, :drowsiness_comment, :nausea, :nausea_comment, :lack_of_appetite, :lack_of_appetite_comment, :shortness_of_breath, :shortness_of_breath_comment, :depression, :depression_comment, :wellbeing, :wellbeing_comment, :other_symptom_id, :other_symptom_score, :other_symptom_comment, :esas_comment)
    end

end