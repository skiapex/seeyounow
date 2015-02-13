class EsasAssesmentsController < ApplicationController

  def index
    @esas_assesments = EsasAssesment.all
  end

  def show
    @esas_assesment = EsasAssesment.find_by(id: params["id"])
  end

  def new
    @esas_assesment = EsasAssesment.new
  end

  def create
    esas_assesment_params = params.require(:esas_assesment).permit(:patient_id,:clinician_id,:time,:inputter_name, :inputter_id, :pain, :pain_comment, :tiredness, :tiredness_comment, :drowsiness, :drowsiness_comment, :nausea, :nausea_comment, :lack_of_appetite, :lack_of_appetite_comment, :shortness_of_breath, :shortness_of_breath_comment, :depression, :depression_comment, :wellbeing, :wellbeing_comment, :other_symptom_id, :other_symptom_score, :other_symptom_comment, :esas_comment)
    EsasAssesment.create(esas_assesment_params)
    redirect_to esas_assesments_path
  end

  def edit
    @esas_assesment = EsasAssesment.find_by(id: params["id"])
  end

  def update
    esas_assesment_params = params.require(:esas_assesment).permit(:patient_id,:clinician_id,:time,:inputter_name, :inputter_id, :pain, :pain_comment, :tiredness, :tiredness_comment, :drowsiness, :drowsiness_comment, :nausea, :nausea_comment, :lack_of_appetite, :lack_of_appetite_comment, :shortness_of_breath, :shortness_of_breath_comment, :depression, :depression_comment, :wellbeing, :wellbeing_comment, :other_symptom_id, :other_symptom_score, :other_symptom_comment, :esas_comment)
    @esas_assesment = EsasAssesment.find_by(id: params["id"])
    @esas_assesment.update_attributes(esas_assesment_params)
    redirect_to esas_assesments_path
  end

  def destroy
    @esas_assesment = EsasAssesment.find_by(id: params["id"])
    @esas_assesment.destroy
    redirect_to esas_assesments_path
  end

end