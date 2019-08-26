class Admin::BusOwnersController < ApplicationController

  before_action :set_bus_owner, only:[:active, :suspend, :reject, :show]
  
  def index
    @bus_owners = BusOwner.all
  end

  def show
  end
  # -------------------- Bus Owner Active --------------------
  def active
    @bus_owner.update(status:"active")
    @bus_owner.save
    flash[:notice] = "#{@bus_owner.name}'s Account is Activated"
    redirect_to admin_bus_owners_path
  end
  # -------------------- Bus Owner Suspend --------------------
  def suspend
    @bus_owner.update(status:"pending")
    flash[:warning] = "#{@bus_owner.name}'s Account is Suspended"
    @bus_owner.save
    redirect_to admin_bus_owners_path
  end
  # -------------------- Bus Owner Reject --------------------
  def reject
    @bus_owner.update(status:"ignore")
    flash[:error] = "#{@bus_owner.name}'s Account is Rejected"
    @bus_owner.save
    redirect_to admin_bus_owners_path
  end

  private
  # -------------------- Bus Owner Buses --------------------
  def set_bus_owner
    @bus_owner = BusOwner.find(params[:id])
  end
end
