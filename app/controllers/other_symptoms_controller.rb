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

  private
    def other_symptom_params
      params.require(:other_symptom).permit(:symptom_type)
    end

end
