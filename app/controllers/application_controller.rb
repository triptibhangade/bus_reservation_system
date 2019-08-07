class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # --------------------------- Required User Sign In -----------------------
  def required_user_signin
    unless current_user && current_bus_owner
      flash[:error] = "Please Sign In Properly"
      redirect_to root_path
    end
  end
  
  # ------------------------------ Required User Sign Out ------------------------
  def required_user_signout
    if current_user && current_bus_owner
      flash[:error] = "Please Sign out Properly"
      redirect_to root_path
    end
  end
  # --------------------------- Required Bus Owner Sign In -----------------------
  def required_bus_owner_signin
    unless current_bus_owner && current_user
      flash[:error] = "Please Sign In Properly"
      redirect_to root_path
    end
  end
  
  # ------------------------------ Required Bus Owner Sign Out ------------------------
  def required_bus_owner_signout
    if current_bus_owner && current_user
      flash[:error] = "Please Sign out Properly"
      redirect_to root_path
    end
  end

  def seat_full(bus, reservation)
    seat_count = 0
    bus.reservations.each do |reservation|
      seat_count = seat_count + reservation.seat 
    end
    bus.total_no_of_seats - (seat_count - reservation.seat)
  end

  protected
  # -------------------- Device Params --------------------
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gst_no, :license])
  end
end
