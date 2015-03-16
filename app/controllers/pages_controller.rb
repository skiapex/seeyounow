class PagesController < ApplicationController
  skip_before_action :require_clinician

  def index
    @clinicians = Clinician.all
    @esas_assessments = current_clinician.esas_assessments
  end

  def home
    if current_clinician
      @esas_assessments = current_clinician.esas_assessments.order("created_at desc")
      @pfrs_assessments = current_clinician.pfrs_assessments.order("created_at desc")
      @comments = current_clinician.comments.order("created_at desc")
    else
      @esas_assessments = current_user.patient.esas_assessments.order("created_at desc")
      @pfrs_assessments = current_user.patient.pfrs_assessments.order("created_at desc")
      @comments = Patient.find_by(user_id: User.find_by(id: current_user)).comments.order("created_at desc")
    end
  end

  def new
    
  end

  def create
    
  end

  def edit
   
  end

  def update
    
  end

  def _patientfooter
    
  end

end