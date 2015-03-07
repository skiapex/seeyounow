class CliniciansController < ApplicationController
  skip_before_action :require_clinician, only: [:show]

  def index
    @clinicians = Clinician.all
  end

  def show
    @clinician = Clinician.find_by(id: params["id"])
    @care_group = @clinician.care_group
    @gender = @clinician.gender
    @esas_assessments = @clinician.esas_assessments
  end

  def new
    @clinician = Clinician.new
  end

  def create
    clinician_params = params.require(:clinician).permit!
    @clinician = Clinician.create(clinician_params)
    if @clinician.valid?
      redirect_to clinician_path(@clinician), notice: "Clinician created!"
    else
      render "new"
    end
  end

  def edit
    @clinician = Clinician.find_by(id: params["id"])
  end

  def update
    clinician_params = params.require(:clinician).permit(:first_name,:last_name,:occupation_id,:gender_id, :email, :password, :office_number, :mobile_number, :emergency_message, :care_group_id, :user_id)
    @clinician = Clinician.find_by(id: params["id"])
    @clinician.update_attributes(clinician_params)
    if @clinician.valid?
      redirect_to clinician_path(@clinician), notice: "Clinician information edited!"
    else
      render "edit"
    end
  end

  def destroy
    @clinician = Clinician.find_by(id: params["id"])
    @clinician.destroy
    redirect_to clinicians_path
  end

end