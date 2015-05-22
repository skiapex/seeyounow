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
    if current_clinician
      @notes = @patient.notes.order("created_at desc")
    else
      @notes = @clinician.notes.order("created_at desc")
    end
  end

  def new
    @note = Note.new

    if current_clinician
      @notes = current_clinician.notes.order("created_at desc")
    else
      @notes = Patient.find_by(user_id: User.find_by(id: current_user)).notes.order("created_at desc")
    end
  end

  def create
    if current_clinician
      @notes = current_clinician.notes
    else
      @notes = Patient.find_by(user_id: User.find_by(id: current_user)).notes
    end

    note_params = params.require(:note).permit!
    @note = Note.new(note_params)
    if current_clinician
      @note.clinician = current_user.clinician
      @note.from = current_user.clinician.user_id
      if @note.save

        require 'statsmix'
        StatsMix.api_key = "9e744f92096e0902b113"
        StatsMix.track("Clinician Note submitted", 1)
        if StatsMix.error
          puts "Error: #{StatsMix.error}"
        end

        redirect_to notes_path, notice: "Note submitted!"
      else
        render "new", alert: "Note not submitted!"
      end
    else
      @note.patient = current_user.patient
      @note.from = current_user.patient.user_id
      if @note.save

        require 'statsmix'
        StatsMix.api_key = "9e744f92096e0902b113"
        StatsMix.track("Patient Note submitted", 1)
        if StatsMix.error
          puts "Error: #{StatsMix.error}"
        end

        redirect_to notes_path, notice: "Note submitted!"
      else
        render "new", alert: "Note not submitted!"
      end
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