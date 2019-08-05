class UsersController < ApplicationController
  before_action :user_reservations, only:[:show]

  def index
  end

  def show
    @user = current_user
  end

  private
  # -------------------- Customer Reservations --------------------
  def user_reservations
    @user_reservations = current_user.reservations
  end
  
end
