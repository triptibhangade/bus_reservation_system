class BusOwners::BusOwnersController < ApplicationController
  before_action :my_buses, only: [:show]

  def show
    @bus_owner = current_bus_owner
  end

  private
  # -------------------- Bus Owner Buses --------------------
  def my_buses
    @my_buses = current_bus_owner.buses
  end
end
