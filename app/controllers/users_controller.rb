class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bookings = Booking.where(user: current_user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :photo)
  end
end
