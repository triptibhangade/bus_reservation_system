class BusOwnersController < ApplicationController
  def index

  end

  def show
    @bus_owner = BusOwner.find(params[:id])
  end
end
