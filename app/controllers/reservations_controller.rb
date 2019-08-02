class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_user_id_into_params, only: [:create, :destroy]
  before_action :set_bus, only: [:new, :create]

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
    @reservation = @bus.reservations.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = @bus.reservations.new(reservation_params)
    @reservation.user_id = set_user_id_into_params
  

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to buses_path, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
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
    binding.pry
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to buses_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find_by(user_id: current_user.id)
    end

    def set_user_id_into_params
      if current_user
        current_user.id
      else
        current_bus_owner.id 

      end
      # if current_bus_owner
      #    params[:reservation][:user_id] = current_bus_owner.id if params[:reservation]
      # end
    end

    def set_bus
      @bus = Bus.find(params[:bus_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:reservation_date, :bus_id, :seat)
    end
end
