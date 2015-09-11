class SpecialitiesController < ApplicationController

  def index
      @specialities = Speciality.all.order("occupation_id asc")
  end

  def show
    @speciality = Speciality.find_by(id: params["id"])
  end

  def new
    @speciality = Speciality.new
  end

  def create
    @speciality = Speciality.create(speciality_params)
    if @speciality.save
      redirect_to specialities_path notice: "Speciality added!"
    else
      render "new", alert: "Speciality not added!"
    end
  end

  def edit
    @speciality = Speciality.find_by(id: params["id"])
  end

  def update
    @speciality = Speciality.find_by(id: params["id"])
    @speciality.update_attributes(speciality_params)
    if @speciality.valid?
      redirect_to specialities_path, notice: "Speciality edited!"
    else
      render "edit", alert: "Speciality edited!"
    end
  end

  def destroy
    @speciality = Speciality.find_by(id: params["id"])
    @speciality.destroy
    redirect_to specialities_path, notice: "Speciality deleted!"
  end

  private
    def speciality_params
      params.require(:speciality).permit(:name,:occupation_id)
    end

end
