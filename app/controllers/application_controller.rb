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
    User.find_by(id: session["user_id"])
  end

  def require_user
    if current_user.nil?
      redirect_to new_session_path
    end
  end

  def current_clinician
    Clinician.find_by(user_id: User.find_by(id: session["user_id"]))
  end

  def require_clinician
    if current_clinician.nil?
      redirect_to new_session_path
    end
  end

  def admin
    if Clinician.find_by(user_id: User.find_by(id: session["user_id"])).administrator = true
      Clinician.find_by(user_id: User.find_by(id: session["user_id"]))
    end
  end

  def require_admin
    if admin.nil?
      redirect_to new_session_path
    end
  end

end
