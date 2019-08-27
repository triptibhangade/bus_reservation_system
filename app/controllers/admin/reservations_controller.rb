class Admin::ReservationsController < ApplicationController
  before_action :required_admin_signin
  before_action :set_bus, only: [:new, :create]
  before_action :find_reservation, only: [:cancel]
  before_action :required_signin, only:[:new,:create,:cancel]

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

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = customer.reservations.new(reservation_params)
    @reservation.bus_id = @bus.id

    session[:seat_no].each do |seat|
       @reservation.seats.build(seat_no: seat.to_i, reserved: true)
    end

    @reservation.seat = session[:seat_no].count

    if !@reservation.seat.zero? && !@reservation.reservation_date.nil?
      respond_to do |format|
        if @reservation.save
          format.html { redirect_to root_path, notice: "Seat book successfully in #{@bus.name} with #{@reservation.seat} Seats..." }
          format.json { render :show, status: :created, location: @reservation }
        else
          format.html { render :new }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Please choose date and seat properly..."
      redirect_to new_bus_reservation_path
    end

  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
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

  def book_seat
    if session[:seat_no].include?(params[:seat])
      seat = session[:seat_no].delete(params[:seat])
    else  
      seat = session[:seat_no].push(params[:seat])
    end
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

    # -------------------- Find Customer --------------------
    def customer
      if current_user
        current_user
      elsif current_bus_owner
        current_bus_owner
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:reservation_date, :bus_id, :seat)
    end
end
