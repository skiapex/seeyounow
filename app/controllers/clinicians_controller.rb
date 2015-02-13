class CliniciansController < ApplicationController

  def index
    @clinicians = Clinician.all
  end

  def show
    @clinician = Clinician.find_by(id: params["id"])
    @care_group = @clinician.care_group
    @gender = @clinician.gender
    @esas_assesments = @clinician.esas_assesments
  end

  def new
    @clinician = Clinician.new
  end

  def create
    clinician_params = params.require(:clinician).permit(:first_name,:last_name,:occupation_id,:gender_id, :email, :password, :office_number, :mobile_number, :emergency_message, :care_group_id)
    Clinician.create(clinician_params)
    #render text: params["clinician"]
    redirect_to clinicians_path
  end

  def edit
    @clinician = Clinician.find_by(id: params["id"])
  end

  def update
    clinician_params = params.require(:clinician).permit(:first_name,:last_name,:occupation_id,:gender_id, :email, :password, :office_number, :mobile_number, :emergency_message, :care_group_id)
    @clinician = Clinician.find_by(id: params["id"])
    @clinician.update_attributes(clinician_params)
    redirect_to clinicians_path
  end

  def destroy
    @clinician = Clinician.find_by(id: params["id"])
    @clinician.destroy
    redirect_to clinicians_path
  end

end