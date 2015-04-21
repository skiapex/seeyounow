class CareGroupsController < ApplicationController

  def index
      @care_groups = CareGroup.all.order("symptom_type asc")
  end

  def show
    @care_group = CareGroup.find_by(id: params["id"])
  end

  def new
    @care_group = CareGroup.new
  end

  def create
    care_group_params = params.require(:care_group).permit(:patient_id, :clinician_id, :time, :year, :month, :day, :inputter_name, :inputter_id, :pain, :pain_comment, :tiredness, :tiredness_comment, :drowsiness, :drowsiness_comment, :nausea, :nausea_comment, :lack_of_appetite, :lack_of_appetite_comment, :shortness_of_breath, :shortness_of_breath_comment, :depression, :depression_comment, :wellbeing, :wellbeing_comment, :care_group_id, :care_group_score, :care_group_comment, :esas_comment)
    @care_group = CareGroup.create(care_group_params)
    if @care_group.save
      redirect_to clinicians_path, notice: "Care Group added!"
    else
      render "new", alert: "Care Group not added!"
    end
  end

  def edit
    @care_group = CareGroup.find_by(id: params["id"])
  end

  def update
    care_group_params = params.require(:care_group).permit!
    @care_group = CareGroup.find_by(id: params["id"])
    @care_group.update_attributes(care_group_params)
    if @care_group.valid?
      redirect_to clinicians_path, notice: "Care Group edited!"
    else
      render "edit", alert: "Care Group edited!"
    end
  end

  def destroy
    @care_group = CareGroup.find_by(id: params["id"])
    @care_group.destroy
    redirect_to clinicians_path, notice: "Care Group deleted!"
  end

end
