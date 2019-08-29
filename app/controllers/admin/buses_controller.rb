class Admin::BusesController < ApplicationController
  before_action :required_admin_signin?
  before_action :set_bus, only: [:destroy]
  # GET /buses
  # GET /buses.json
  def index
    @buses = Bus.all
  end

  # GET /buses/1
  # GET /buses/1.json
  def show
  end

  # DELETE /buses/1
  # DELETE /buses/1.json
  def destroy
    @bus.destroy
    respond_to do |format|
      format.html { redirect_to admin_buses, notice: 'Bus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus
      @bus = Bus.find(params[:id])
    end
end
