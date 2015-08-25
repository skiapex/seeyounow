class NotesController < ApplicationController
  skip_before_action :require_admin

  def index
    if current_clinician
      @notes = current_clinician.notes
    else
      @notes = Patient.find_by(user_id: User.find_by(id: current_user)).notes
    end
  end

  def show
    @note = Note.find_by(id: params["id"])
    @patient = @note.patient
    @clinician = @note.clinician
    @notes = @patient.notes.order("created_at desc")
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    @note.clinician = current_user.clinician
    if @note.save
      redirect_to patient_path(@note.patient.id), notice: "Note submitted!"
    else
      render "new", alert: "Note not submitted!"
    end
  end


  def edit
    @note = Note.find_by(id: params["id"])
    @user = @note.from
    @clinician = Clinician.find_by(user_id: @user)
    @patient = Patient.find_by(user_id: @user)
  end

  def update
    @note = Note.find_by(id: params["id"])
    @note.update_attributes(note_params)
    if @note.valid?
      redirect_to note_path(@note), notice: "Note edited!"
    else
      render "edit", alert: "Note not edited!"
    end
  end

  def destroy
    @note = Note.find_by(id: params["id"])
    @note.destroy

    redirect_to notes_path, notice: "Note deleted!"
  end

  private

    def note_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:note).permit( :patient_id,:clinician_id,:created_at,:updated_at,:care_note)
    end

end