class OccupationsController < ApplicationController

  def index
      @occupations = Occupation.all.order("name asc")
  end

  def show
    @occupation = Occupation.find_by(id: params["id"])
  end

  def new
    @occupation = Occupation.new
  end

  def create
    @occupation = Occupation.create(occupation_params)
    if @occupation.save
      redirect_to occupations_path, notice: "Occupation added!"
    else
      render "new", alert: "Occupation not added!"
    end
  end

  def edit
    @occupation = Occupation.find_by(id: params["id"])
  end

  def update
    @occupation = Occupation.find_by(id: params["id"])
    @occupation.update_attributes(occupation_params)
    if @occupation.valid?
      redirect_to occupations_path, notice: "Occupation edited!"
    else
      render "edit", alert: "Occupation edited!"
    end
  end

  def destroy
    @occupation = Occupation.find_by(id: params["id"])
    @occupation.destroy
    redirect_to occupations_path, notice: "Occupation deleted!"
  end

  private
    def occupation_params
      params.require(:occupation).permit(:name,:acronym,:pronym)
    end

end
