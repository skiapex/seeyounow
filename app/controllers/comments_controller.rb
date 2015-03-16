class CommentsController < ApplicationController
  skip_before_action :require_clinician, only: [:new, :show, :index]

  def index
    if current_clinician
      @comments = current_clinician.comments
    else
      @comments = Patient.find_by(user_id: User.find_by(id: current_user)).comments
    end
  end

  def show
    @patient = Patient.find_by(id: params["id"])
    # @clinician = @comment.clinician
    # @comment = @comment.patient
  end

  def new
    @comment = Comment.new
  end

  def create
    if current_clinician
      @comments = current_clinician.comments
    else
      @comments = Patient.find_by(user_id: User.find_by(id: current_user)).comments
    end

    comment_params = params.require(:comment).permit!
    if current_clinician
      @comment = @patient.comments.new(comment_params)
      @comment.clinician = current_clinician
      @comment.from = current_clinician
      if @comment.save
        redirect_to comments_path, notice: "Comment submitted!"
      else
        render "new", alert: "Comment not submitted!"
      end
    else
      @comment = @clinician.comments.new(comment_params)
      @comment.patient = current_user.patient
      @comment.from = current_user.patient
      if @comment.save
        redirect_to comments_path, notice: "Comment submitted!"
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
    comment_params = params.require(:comment).permit!
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

end