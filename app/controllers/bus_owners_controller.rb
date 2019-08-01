class BusOwnersController < ApplicationController
  before_action :my_buses, only: [:show]
  
  def index
  end

  def show
    @bus_owner = current_bus_owner
  end

  private
  def my_buses
    @my_buses = current_bus_owner.buses
  end
end
