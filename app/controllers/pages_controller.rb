class PagesController < ApplicationController
  skip_before_action :require_clinician
  skip_before_action :require_admin

  def index
    @clinicians = Clinician.all
    @esas_assessments = current_clinician.esas_assessments
  end

  def home
    if current_user.email == "info@seeyounow.ca"
      @esas_assessments = EsasAssessment.all
      @prfs_assessments = PrfsAssessment.all
      @comments = Comment.all
      @care_groups = CareGroup.all
      @feedbacks = Feedback.all
      @clinicians = Clinician.all
      @occupations = Occupation.all
      @specialities = Speciality.all
      @patients = Patient.all
      @other_symptoms = OtherSymptom.all
      @users = User.all
      @notifications = @esas_assessments + @prfs_assessments + @comments
    else
      if current_clinician
        @esas_assessments = current_clinician.esas_assessments.order("created_at desc")
        @prfs_assessments = current_clinician.prfs_assessments.order("created_at desc")
        @comments = current_clinician.comments.order("created_at desc")
        @notifications = @esas_assessments + @prfs_assessments + @comments
      else
        @esas_assessments = current_user.patient.esas_assessments.order("created_at desc")
        @prfs_assessments = current_user.patient.prfs_assessments.order("created_at desc")
        @comments = Patient.find_by(user_id: User.find_by(id: current_user)).comments.order("created_at desc")
      end
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