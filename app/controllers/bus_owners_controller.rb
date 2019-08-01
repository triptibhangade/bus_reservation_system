class BusOwnersController < ApplicationController
  def index

  end

  def show
    @bus_owner = current_bus_owner
  end
end
