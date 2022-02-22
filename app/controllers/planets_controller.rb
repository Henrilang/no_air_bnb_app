class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show]
  def index
    @planets = Planet.all
  end

  def show
  end

  private

  def set_planet
    @planet = planet.find(params[:id])
  end

  def set_params
    require.params(:planet).permit(:name, :user_id)
  end
end
