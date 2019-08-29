class Admin::ReservationsController < ApplicationController
  before_action :required_admin_signin?
  before_action :required_signin, only: [:cancel]
  before_action :find_reservation, only: [:cancel]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    session[:seat_no] = []
    @reservation = @bus.reservations.new
    respond_to do |format|
      format.js {}
      format.html {}
    end
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
    @bus = Bus.find(params[:id])
    @bus_reservations = @bus.reservations
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_reservation
      @reservation = Reservation.find(params[:id])
    end
end
