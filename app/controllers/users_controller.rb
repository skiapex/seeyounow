class UsersController < ApplicationController
  # skip_before_action :require_user, only: [:new]
  skip_before_action :require_clinician, only: [:edit, :update, :agreement]
  skip_before_action :require_admin, only: [:edit, :update, :agreement]
  skip_before_action :require_agreement, only: [:agreement]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params["id"])
  end

  def new
    @user = User.new
    @patient = Patient.new
    @user.build_patient
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

  def agreement
    @user = current_user
  end

  def update
    @user = User.find_by(id: params["id"])
    @user.update(user_params)
    redirect_to root_path, notice: "User updated!"
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
      params.require(:user).permit(:email, :password, :password_confirmation, :auth_token, :password_reset_token, :password_reset_sent_at, :terms_agreement)
    end

end