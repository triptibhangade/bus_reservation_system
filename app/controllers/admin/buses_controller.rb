class Admin::BusesController < ApplicationController
  before_action :set_bus, only: [:edit]
  # GET /buses
  # GET /buses.json
  def index
    @buses = Bus.all
  end

  # GET /buses/1
  # GET /buses/1.json
  def show
  end

  # GET /buses/new
  def new
    @bus = Bus.new
  end

  # GET /buses/1/edit
  def edit
  end

  # POST /buses
  # POST /buses.json
  def create
    @bus = Bus.new(bus_params)
    @bus.bus_owner_id = current_bus_owner

    respond_to do |format|
      if @bus.save
        format.html { redirect_to buses_path, notice: 'Bus was successfully created.' }
        format.json { render :show, status: :created, location: @bus }
      else
        format.html { render :new }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buses/1
  # PATCH/PUT /buses/1.json
  def update
    respond_to do |format|
      if @bus.update(bus_params)
        format.html { redirect_to @bus, notice: 'Bus was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus }
      else
        format.html { render :edit }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buses/1
  # DELETE /buses/1.json
  def destroy
    @bus.destroy
    respond_to do |format|
      format.html { redirect_to buses_url, notice: 'Bus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_search_params
    !params[:source_search].blank? && !params[:destination_search].blank? && !params[:date_search].blank?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus
      @bus = Bus.find(params[:id])
    end

    def bus_reservations
      @bus_reservations = @bus.reservations
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_params
      params.require(:bus).permit(:name, :registration_no, :total_no_of_seats, :bus_owner_id, :source, :destination)
    end
end
