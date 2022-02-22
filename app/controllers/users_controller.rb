class UsersController < ApplicationController
  def bookings
    @user = User.find(params[:id])
    @bookings = Booking.where(user: current_user)
  end

  def my_planets
    @user = User.find(params[:id])
  end

  # private

  # # def user_params
  # #   params.require(:user).permit()
  # # end
end
