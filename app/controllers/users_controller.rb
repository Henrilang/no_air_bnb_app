class UsersController < ApplicationController
  def show
    @user = current_user
    @user_bookings = Booking.where(user_id: current_user)
    @user_planets = Planet.where(user_id: current_user)
  end
end
