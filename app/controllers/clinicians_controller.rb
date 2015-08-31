class CliniciansController < ApplicationController
  skip_before_action :require_clinician, only: [:show]
  skip_before_action :require_admin, only: [:show, :edit]

  def index
    @current_group = current_clinician.care_group_id
    @clinicians = Clinician.where.not(first_name: "System").order("care_group_id asc")
    @care_groups = CareGroup.where.not(name: "System Admin").order("province asc")
  end

  def show
    @clinician = Clinician.find_by(id: params["id"])
    @patients = @clinician.patients.group(:patient_deceased).count
    @current_patients = @patients.values[0]
    @past_patients = @patients.values[1]
  end

  def new
    @clinician = Clinician.new
    @user = User.new
    @clinician.build_user
  end

  def create
    @clinician = Clinician.create(clinician_params)
    
    if @clinician.save
      redirect_to clinician_path(@clinician), notice: "Clinician created!"
    else
      render "new"
    end
  end

  def edit
    @clinician = Clinician.find_by(id: params["id"])
  end

  def update
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
    redirect_to clinicians_path, notice: "Clinician deleted!"
  end

  private

    def clinician_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:clinician).permit( :first_name,:last_name,:occupation_id, :speciality_id,:gender_id, :office_number, :mobile_number, :emergency_message, :care_group_id, :administrator, :user_id, user_attributes: [ :email, :password, :patient_id, :clinician_id ])
    end

end