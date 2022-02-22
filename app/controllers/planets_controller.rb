class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def show
  end

  def new
    @planet = planet.find(params[:id])
    @planet = Planet.new
  end

  def create
  end

  private

  def plant_params
  end
end
