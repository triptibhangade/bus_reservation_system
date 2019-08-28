class BusOwners::BusOwnersController < ApplicationController
  before_action :my_buses, only: [:show]
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

  private
  # -------------------- Find Bus Owner --------------------
  def set_bus_owner
    @bus_owner = current_bus_owner
  end
  # -------------------- Bus Owner Buses --------------------
  def my_buses
    @my_buses = current_bus_owner.buses
  end
end
