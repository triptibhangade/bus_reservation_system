class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_bus, only: [:index, :new, :create]
  # before_action :required_user_signin, only:[:new,:create,:destroy]
  # before_action :required_bus_owner_signin, only:[:new,:create,:destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = @bus.reservations
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    session[:seat_no] = []
    @reservation = @bus.reservations.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = @bus.reservations.new(reservation_params)
    @reservation.user_id = get_user_id
    @reservation.bus_owner_id = get_bus_owner_id

    session[:seat_no].each do |seat|
       @reservation.seats.build(seat_no: seat.to_i)
    end

    @reservation.seat = session[:seat_no].count

    # if @reservation.seat > seat_full(@bus, @reservation)
    #   flash[:error] = "Seat Not Available for this particular date, Please choose other date or bus..."
    #   redirect_to new_bus_reservation_path

    # # elsif @reservation.seat > @bus.total_no_of_seats
    # #   flash[:error] = "We have only #{seat_full(@bus, @reservation)} Seats Available..."
    # #   redirect_to new_bus_reservation_path

    # elsif past_date
    #   flash[:error] = "Past date is not accepted, Please choose another date"
    #   redirect_to new_bus_reservation_path

    if over_fifteen_days
      flash[:error] = "Please choose date under 15 days"
      redirect_to new_bus_reservation_path

    else
      respond_to do |format|
        if @reservation.save
          format.html { redirect_to root_path, notice: "Seat book successfully in #{@bus.name} with #{@reservation.seat} Seats..." }
          format.json { render :show, status: :created, location: @reservation }

        else
          format.html { render :new }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
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
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
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
    def set_reservation
      if current_user
        # -------------------- Customer--------------------
        @reservation = Reservation.find_by(user_id: current_user.id)
      else
        # -------------------- Bus Owner--------------------
        @reservation = Reservation.find_by(bus_owner_id: current_bus_owner.id)
      end
    end

    def set_bus
      @bus = Bus.find(params[:bus_id])
    end

    # -------------------- Customer --------------------
    def get_user_id
      if current_user
        current_user.id
      else
        nil
      end
    end

    # -------------------- Bus Owner --------------------
    def get_bus_owner_id
      if current_bus_owner
        current_bus_owner.id
      else
        nil
      end
    end
    # -------------------- Past Date Reservation --------------------
    def past_date
      @reservation.reservation_date < Date.today
    end
    # -------------------- Under 15 days Reservation --------------------
    def over_fifteen_days
      15.days.from_now < @reservation.reservation_date
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:reservation_date, :bus_id, :seat)
    end
end
