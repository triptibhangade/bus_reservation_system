class BusOwners::ReservationsController < ApplicationController
  before_action :required_signed_in?
  before_action :set_bus, only: [:index,:new, :create, :reservations]
  before_action :find_reservation, only: [:cancel]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = @bus.reservations
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def cancel
    @reservation.update(status: false)
    @reservation.seats.update(reserved: false)
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Reservation was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  def reservations
    @bus_reservations = @bus.reservations
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # -------------------- Find Bus --------------------
    def set_bus
      @bus = Bus.find(params[:bus_id])
    end

    def find_reservation
      @reservation = Reservation.find(params[:id])
    end

    def required_signed_in?
      unless current_bus_owner
        flash[:error] = "Please Sign In With Bus Owner..."
        redirect_to root_path
      end
    end
end
