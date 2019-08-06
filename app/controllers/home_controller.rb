class HomeController < ApplicationController
  def index
    if params[:source_search] || params[:destination_search]
      @busses = Bus.where("source LIKE :source AND destination = :destination",
      {:source => "#{params[:source_search]}%", :destination => params[:destination_search]})
      redirect_to buses_path
    else
      @busses = Bus.all
    end
  end
end
