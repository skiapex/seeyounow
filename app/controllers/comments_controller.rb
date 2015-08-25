class CommentsController < ApplicationController
  skip_before_action :require_clinician
  skip_before_action :require_admin

  def index
    if current_clinician
      @comments = current_clinician.comments
    else
      @comments = Patient.find_by(user_id: current_user.patient.id).comments
    end
  end

  def show
    @comment = Comment.find_by(id: params["id"])
    @patient = @comment.patient
    @clinician = @comment.clinician
    @comments = @patient.comments.order("created_at desc")
  end

  def new
    @comment = Comment.new
    @patient = Patient.find_by(user_id: current_user.patient.id).shared_with
    @clinicians = Clinician.where(id: @patient)

    if current_clinician
      @comments = current_clinician.comments.order("created_at desc")
    else
      @comments = Patient.find_by(user_id: User.find_by(id: current_user)).comments.order("created_at desc")
    end
  end

  def create
    if current_clinician
      @comments = current_clinician.comments
    else
      @comments = Patient.find_by(user_id: User.find_by(id: current_user)).comments
    end

    @comment = Comment.new(comment_params)
    if current_clinician
      @comment.clinician = current_user.clinician
      @comment.from = current_user.clinician.user_id
      if @comment.save

        redirect_to comment_path(@comment), notice: "Comment submitted!"
      else
        render "new", alert: "Comment not submitted!"
      end
    else
      @comment.patient = current_user.patient
      @comment.from = current_user.patient.user_id
      if @comment.save

        redirect_to comment_path(@comment), notice: "Comment submitted!"
      else
        render "new", alert: "Comment not submitted!"
      end
    end
  end


  def edit
    @comment = Comment.find_by(id: params["id"])
    @user = @comment.from
    @clinician = Clinician.find_by(user_id: @user)
    @patient = Patient.find_by(user_id: @user)
  end

  def update
    @comment = Comment.find_by(id: params["id"])
    @comment.update_attributes(comment_params)
    if @comment.valid?
      redirect_to comment_path(@comment), notice: "Comment edited!"
    else
      render "edit", alert: "Comment not edited!"
    end
  end

  def destroy
    @comment = Comment.find_by(id: params["id"])
    @comment.destroy

    redirect_to comments_path, notice: "Comment deleted!"
  end

  private

    def comment_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:comment).permit( :patient_id,:clinician_id,:from,:created_at,:updated_at,:general_comment)
    end

end