class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :new, :create]
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
    @planet.user = @user
    if @planet.save
      redirect_to planet_path(@planet)
    else
      render :new
    end
  end

  private

  def set_planet
    @planet = planet.find(params[:id])
  end

  def set_params
    require.params(:planet).permit(:name, :user_id)
  end
end
