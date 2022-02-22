class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show]

  def index
    @planets = Planet.all
  end

  def show
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(set_params)
    @planet.user = current_user
    if @planet.save
      redirect_to planet_path(@planet)
    else
      render :new
    end
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def set_params
    params.require(:planet).permit(:name, :location)
  end
end
