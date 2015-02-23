class SessionsController < ApplicationController
  layout false
  skip_before_action :require_user

  def create
    # params["email"] => the email address
    # params["password"] => the password
    # Do authentication
    # Redirect to the root_path
    # Display a notice that login was either successful or unsuccessful

    user = User.find_by(email: params["email"])
    if user && user.authenticate(params["password"])
      session["user_id"] = user.id

      clinician = Clinician.find_by(user_id: params["user_id"])
      if clinician
        redirect_to clinicians_path, notice: "Login successful!"
      else
        redirect_to patients_path, notice: "Login successful!"
      end
    else
      redirect_to root_path, alert: "Email or password incorrect"
    end

  end

  def destroy
    # Do sign-out
    session["user_id"] = nil
    redirect_to root_path, notice: "Logout successful!"
  end

end