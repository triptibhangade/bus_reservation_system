class Admin::UsersController < ApplicationController
  before_action :required_admin_signin
  
  def index
    @users =  User.all.where(role: "customer")
  end

  def show
    @user = current_user
  end

  # ---------------------- Admin Reservations ----------------------
  def my_reservations
    @reservations = current_user.reservations.where(status: true)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_customers_path, notice: "Customer #{@user.name}'s account was successfully removed." }
      format.json { head :no_content }
    end
  end
end
