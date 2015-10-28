class CareGiversController < ApplicationController
  skip_before_action :require_admin
  skip_before_action :require_clinician

  def index
    if current_clinician
    else
      @care_givers = Patient.find_by(user_id: current_user).care_givers
    end
  end

  def show
    @care_giver = CareGiver.find_by(id: params["id"])
    @patient = @care_giver.patient

    if current_clinician
      if @patient.clinicians.include?(current_clinician)
      else
        redirect_to root_path, notice: "You tried to access information you do not have authorization for"
      end
    else
      if @patient.id == current_user.patient.id
      else
        redirect_to root_path, notice: "You tried to access information you do not have authorization for"
      end
    end
  end

  def new
    @care_giver = CareGiver.new
    if current_clinician
    else
      @care_givers = Patient.find_by(user_id: current_user).care_givers
    end
  end

  def create
    @care_giver = CareGiver.new(care_giver_params)

    if current_clinician
    else
      @care_giver.patient = current_user.patient
    end

    if @care_giver.save
      redirect_to patient_path(@care_giver.patient.id), notice: "Care giver submitted!"
    else
      render "new", alert: "Care giver not submitted!"
    end
  end


  def edit
    @care_giver = CareGiver.find_by(id: params["id"])
  end

  def update
    @care_giver = CareGiver.find_by(id: params["id"])
    @care_giver.update_attributes(care_giver_params)
    if @care_giver.valid?
      redirect_to care_giver_path(@care_giver), notice: "CareGiver edited!"
    else
      render "edit", alert: "CareGiver not edited!"
    end
  end

  def destroy
    @care_giver = CareGiver.find_by(id: params["id"])
    @care_giver.destroy

    redirect_to patient_path(@care_giver.patient), notice: "Care Giver deleted!"
  end

  private

    def care_giver_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:care_giver).permit( :patient_id,:inputter_id,:first_name,:last_name,:phone_number,:other_information)
    end

end