class CliniciansController < ApplicationController

  def index
    @clinicians = Clinician.all
  end

  def show
    @clinician = Clinician.find_by(id: params["id"])
    @care_group = CareGroup.find_by(id: @clinician.care_group_id)
    @esas_assesments = EsasAssesment.where(clinician_id: @clinician.id)

  end

  def new
    @clinician = Clinician.new
  end

end