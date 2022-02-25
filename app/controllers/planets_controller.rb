class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      sql_query = " \
        planets.name @@ :query \
        OR planets.location @@ :query \
      "
      @planets = Planet.where(sql_query, query: "%#{params[:query]}%")
    else
      @planets = Planet.all
    end
    @planets = Planet.geocoded
    @markers = @planets.map do |planet|
      {
        lat: rand(-60..60).to_f,
        lng: rand(-150..150).to_f,
        info_window: render_to_string(partial: "info_window", locals: { planet: planet }),
        image_url: "http://res.cloudinary.com/dnkevcp8q/image/upload/v1/development/#{planet.photos.first.key}"
      }
    end
  end

  # def index
  #   if params[:query].present?
  #     sql_query = " \
  #       planets.name @@ :query \
  #       OR planets.location @@ :query \
  #     "
  #     @planets = Planet.where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @planets = Planet.all
  #   end
  #   @markers = @planets.geocoded.map do |planet|
  #     {
  #       lat: planet.latitude,
  #       lng: planet.longitude,
  #       info_window: render_to_string(partial: "info_window", locals: { planet: planet })
  #     }
  #   end
  # end

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

  def edit
    @planet = Planet.find(params[:id])
  end

  def update
    @planet.update(set_params)
    if @planet.save
      redirect_to planet_path(@planet)
    else
      render :edit
    end
  end

  def destroy
    @planet.destroy
    redirect_to planets_path
    # no need for app/views/restaurants/destroy.html.erb
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def set_params
    params.require(:planet).permit(:name, :location, :description, :address, photos: [])
  end
end
