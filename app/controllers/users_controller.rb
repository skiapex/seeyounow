class UsersController < ApplicationController
  skip_before_action :require_clinician, only: [:edit, :update]
  skip_before_action :require_admin, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params["id"])
  end

  def new
    @user = User.new
    @patient = Patient.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to user_path(@user), notice: "User created!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find_by(id: params["id"])
  end

  def update
    user_params = params.require(:user).permit!
    @user = User.find_by(id: params["id"])
    @user.update(user_params)
    redirect_to user_path(@user), notice: "User updated!"
  end

  def destroy
    @user = User.find_by(id: params["id"])
    @user.destroy
    redirect_to users_path
  end


  private

    def user_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:user).permit(:email, :password, patient_attributes: [ :first_name,:last_name,:user_id,:diagnosis,:gender_id,:age,:address, :email, :password, :phone_number, :caregiver_name, :other_symptom, :goals_of_care, :patient_deceased, :patient_archived ])
    end

end