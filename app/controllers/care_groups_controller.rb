class CareGroupsController < ApplicationController

  def index
      @care_groups = CareGroup.all.order("symptom_type asc")
  end

  def show
    @care_group = CareGroup.find_by(id: params["id"])
    @clinicians = Clinician.where(care_group_id: @care_group.id).order("last_name asc")
  end

  def new
    @care_group = CareGroup.new
  end

  def create
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
    @care_group = CareGroup.find_by(id: params["id"])
    @care_group.update_attributes(care_group_params)
    if @care_group.valid?
      redirect_to clinicians_path, notice: "Care Group edited!"
    else
      render "edit", alert: "Care Group not updated!"
    end
  end

  def destroy
    @care_group = CareGroup.find_by(id: params["id"])
    @care_group.destroy
    redirect_to clinicians_path, notice: "Care Group deleted!"
  end

  private
    def care_group_params
      params.require(:care_group).permit!
    end   

end
