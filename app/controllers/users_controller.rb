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
  end

  def create
    user_params = params.require(:user).permit!
    @user = User.create(user_params)
    if @user.valid?
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

end