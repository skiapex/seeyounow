class FeedbacksController < ApplicationController
  skip_before_action :require_clinician, only: [:new, :create, :show, :edit, :update]
  skip_before_action :require_admin, only: [:new, :create, :show, :edit, :update]

  def index
      @feedbacks = Feedback.all
  end

  def show
    @feedback = Feedback.find_by(id: params["id"])
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
      if current_clinician
        @feedback.full_name = current_user.clinician.full_name
      else
        @feedback.full_name = Patient.find_by(user_id: current_user.id).full_name
      end 

        if @feedback.save
          redirect_to feedback_path(@feedback), notice: "Feedback submitted!"
        else
          render "new", alert: "Feedback not submitted!"
        end
  end


  def edit
    @feedback = Feedback.find_by(id: params["id"])
  end

  def update
    @feedback = Feedback.find_by(id: params["id"])
    @feedback.update_attributes(feedback_params)
    if @feedback.valid?
      redirect_to feedback_path(@feedback), notice: "Feedback edited!"
    else
      render "edit", alert: "Feedback not edited!"
    end
  end

  def destroy
    @feedback = Feedback.find_by(id: params["id"])
    @feedback.destroy

    redirect_to root_path, notice: "Feedback deleted!"
  end

  private

    def feedback_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:feedback).permit( :full_name,:created_at,:feedback_comment)
    end

end