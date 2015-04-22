class SessionsController < ApplicationController
  layout false
  skip_before_action :require_user
  skip_before_action :require_clinician
  skip_before_action :require_admin

  def create
    user = User.find_by(email: params["email"])
    if user && user.authenticate(params["password"])
      session["user_id"] = user.id

      clinician = Clinician.find_by(user_id: User.find_by(email: params["email"]).id)
      if clinician
        redirect_to root_path, notice: "Login successful!"
      else
        redirect_to root_path, notice: "Login successful!"
      end
    else
      redirect_to new_session_path, alert: "Email or password incorrect"
    end
  end

  def destroy
    session["user_id"] = nil
    redirect_to new_session_path, notice: "Logout successful!"
  end

end