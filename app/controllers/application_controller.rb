class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  
  helper_method :current_user
  before_action :require_user
  helper_method :current_clinician
  before_action :require_clinician
  helper_method :admin
  before_action :require_admin

  def current_user
    @current_user ||= User.find_by!(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end

  def require_user
    if current_user.nil?
      redirect_to new_session_path
    end
  end

  def current_clinician
    current_user.clinician
  end

  def require_clinician
    if current_clinician.nil?
      redirect_to root_path
    end
  end

  def admin
    if current_clinician.administrator == true
      current_clinician.administrator
    end
  end

  def require_admin
    if admin.nil?
      redirect_to root_path
    end
  end

  def user_agreement
    if current_user.terms_agreement == true
      current_user.terms_agreement
    end
  end

  def require_agreement
    if user_agreement.nil?
      redirect_to agreement_path
    end
  end

end