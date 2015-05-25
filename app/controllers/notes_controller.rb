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
    note_params = params.require(:note).permit!
    @note = Note.new(note_params)

    @note.clinician = current_user.clinician
    if @note.save

      require 'statsmix'
      StatsMix.api_key = "9e744f92096e0902b113"
      StatsMix.track("Note Created", 1)
      if StatsMix.error
        puts "Error: #{StatsMix.error}"
      end

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
    note_params = params.require(:note).permit!
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

    require 'statsmix'
    StatsMix.api_key = "9e744f92096e0902b113"
    StatsMix.track("Note deleted", 1)
    if StatsMix.error
      puts "Error: #{StatsMix.error}"
    end

    redirect_to notes_path, notice: "Note deleted!"
  end

end