class HomeController < ApplicationController
  def index
    @busses = Bus.all
  end
end
