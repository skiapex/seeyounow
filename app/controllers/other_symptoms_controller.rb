class OtherSymptomsController < ApplicationController
  skip_before_action :require_clinician, only: [:new, :show]
  skip_before_action :require_admin

  def index
      @other_symptoms = OtherSymptom.all.order("symptom_type asc")
  end

  def show
    @other_symptom = OtherSymptom.find_by(id: params["id"])
  end

  def new
    @other_symptom = OtherSymptom.new
  end

  def create
    other_symptom_params = params.require(:other_symptom).permit(:patient_id, :clinician_id, :time, :year, :month, :day, :inputter_name, :inputter_id, :pain, :pain_comment, :tiredness, :tiredness_comment, :drowsiness, :drowsiness_comment, :nausea, :nausea_comment, :lack_of_appetite, :lack_of_appetite_comment, :shortness_of_breath, :shortness_of_breath_comment, :depression, :depression_comment, :wellbeing, :wellbeing_comment, :other_symptom_id, :other_symptom_score, :other_symptom_comment, :esas_comment)
    @other_symptom = OtherSymptom.create(other_symptom_params)
    if @other_symptom.save
      redirect_to other_symptoms_path(@other_symptom), notice: "Other Symptom added!"
    else
      render "new", alert: "Other Symptom not added!"
    end
  end

  def edit
    @other_symptom = OtherSymptom.find_by(id: params["id"])
  end

  def update
    other_symptom_params = params.require(:other_symptom).permit!
    @other_symptom = OtherSymptom.find_by(id: params["id"])
    @other_symptom.update_attributes(other_symptom_params)
    if @other_symptom.valid?
      redirect_to other_symptom_path(@other_symptom), notice: "Other Symptom edited!"
    else
      render "edit", alert: "Other Symptom edited!"
    end
  end

  def destroy
    @other_symptom = OtherSymptom.find_by(id: params["id"])
    @other_symptom.destroy
    redirect_to other_symptoms_path, notice: "Other Symptom deleted!"
  end

end
