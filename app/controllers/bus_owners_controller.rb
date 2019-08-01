class BusOwnersController < ApplicationController
  before_action :my_buses, only: [:show]
  before_action :set_bus_owner, only:[:active]
  
  def index
    @bus_owners = BusOwner.all
  end

  def show
    @bus_owner = current_bus_owner
  end

  def active
    binding.pry
    @bus_owner.update(status:"active")
    @bus_owner.save
    redirect_to bus_owner_index_path
  end

  private
  def my_buses
    @my_buses = current_bus_owner.buses
  end

  def set_bus_owner
    @bus_owner = BusOwner.find(params[:format])
  end
end
