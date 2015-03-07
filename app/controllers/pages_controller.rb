class PagesController < ApplicationController
  skip_before_action :require_clinician

  def index
    @clinicians = Clinician.all
  end

  def home
    
  end

  def new
    
  end

  def create
    
  end

  def edit
   
  end

  def update
    
  end

  def destroy
    
  end

end