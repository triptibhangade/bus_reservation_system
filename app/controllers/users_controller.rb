class UsersController < ApplicationController
  before_action :required_signin?

  def show
    @user = current_user
  end

  # ---------------------- Customer Reservations ----------------------
  def my_reservations
    @reservations = current_user.reservations.where(status: true)
  end
end
