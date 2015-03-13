class PagesController < ApplicationController
  skip_before_action :require_clinician

  def index
    @clinicians = Clinician.all
    @esas_assessments = current_clinician.esas_assessments
  end

  def home
    @esas_assessments = current_clinician.esas_assessments
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