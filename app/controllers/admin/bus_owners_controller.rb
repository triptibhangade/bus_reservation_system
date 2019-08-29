class Admin::BusOwnersController < ApplicationController
  before_action :required_admin_signin
  before_action :set_bus_owner, only:[:active, :suspend, :reject, :show]
  
  def index
    @bus_owners = BusOwner.all
  end

  def show
  end
  # -------------------- Bus Owner Active --------------------
  def active
    @bus_owner.update(status: "active")
    @bus_owner.buses.update(status: "active")
    @bus_owner.save
    flash[:notice] = "#{@bus_owner.name}'s Account is Activated"
  end
  # -------------------- Bus Owner Suspend --------------------
  def suspend
    @bus_owner.update(status:"pending")
    @bus_owner.buses.update(status: "suspend")
    flash[:warning] = "#{@bus_owner.name}'s Account is Suspended"
    @bus_owner.save
  end
  # -------------------- Bus Owner Reject --------------------
  def reject
    @bus_owner.update(status:"ignore")
    @bus_owner.buses.update(status: "suspend")
    flash[:error] = "#{@bus_owner.name}'s Account is Rejected"
    @bus_owner.save
  end

  private
  # -------------------- Bus Owner Buses --------------------
  def set_bus_owner
    @bus_owner = BusOwner.find(params[:id])
  end
end
