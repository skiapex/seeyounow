class SessionsController < ApplicationController
  layout false
  skip_before_action :require_user

  def create
    user = User.find_by(email: params["email"])
    if user && user.authenticate(params["password"])
      session["user_id"] = user.id

      clinician = Clinician.find_by(user_id: User.find_by(email: params["email"]).id)
      patient = Patient.find_by(user_id: User.find_by(email: params["email"]).id)
      if clinician
        redirect_to clinician_path(current_user.clinician), notice: "Login successful!"
      else
        redirect_to patient_path(current_user.patient), notice: "Login successful!"
      end
    else
      redirect_to root_path, alert: "Email or password incorrect"
    end
  end

  def destroy
    session["user_id"] = nil
    redirect_to root_path, notice: "Logout successful!"
  end

end