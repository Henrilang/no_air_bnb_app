class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  before_action :planet_params, only: [:new, :create, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.planet = @planet
    if @booking.save
      redirect_to user_path(current_user)
    else
      redirect_to planet_path(@planet)
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def planet_params
    @planet = Planet.find(params[:planet_id])
  end

  def booking_params
    params[:booking].permit(:start_date, :end_date)
  end
end
