class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # --------------------------- Required Admin Sign In -----------------------
  def required_admin_signin
    unless current_user.try(:role)=="admin" || current_bus_owner
      flash[:error] = "You are not admin"
      redirect_to root_path
    end
  end
  # --------------------------- Required Sign In -----------------------
  def required_signin
    unless current_user || current_bus_owner
      flash[:error] = "Please Sign In Before Book Seat..."
      redirect_to root_path
    end
  end
  
  # ------------------------------ Required Sign Out ------------------------
  def required_signout
    if current_user || current_bus_owner
      flash[:error] = "Please Sign out Properly..."
      redirect_to root_path
    end
  end

  # ------------------------------ Search Buses by source and destination ------------------------
  def buses
    @buses = Bus.search(params[:source_search], params[:destination_search])
  end

  protected

  # -------------------- Device Params --------------------
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gst_no, :license])
  end
end
