class BusOwners::BusOwnersController < ApplicationController
  before_action :required_signed_in?
  before_action :set_bus_owner, only: [:show, :destroy]

  def show
    @bus_owner = current_bus_owner
  end

  def destroy
    @bus_owner.destroy
    respond_to do |format|
      format.html { redirect_to buses_url, notice: "#{@bus_owner.name}\'s account is successfully deactivated." }
      format.json { head :no_content }
    end
  end

  # -------------------- Bus Owner Buses --------------------
  def my_buses
    @my_buses = current_bus_owner.buses
  end

  # ---------------------- Bus Owner Reservations ----------------------
  def my_reservations
    @reservations = current_bus_owner.reservations.where(status: true)
  end
  # ---------------------- Bus Owner All Buses Reservations ----------------------
  def all_reservations
    # binding.pry
    @bus_ids = current_bus_owner.buses.map(&:id)

    # @all_reservations = 
  end

  private
  # -------------------- Find Bus Owner --------------------
  def set_bus_owner
    @bus_owner = current_bus_owner
  end

  def required_signed_in?
    unless current_bus_owner
      flash[:error] = "Please Sign In With Bus Owner..."
      redirect_to root_path
    end
  end
  
end
