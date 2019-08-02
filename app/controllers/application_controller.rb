class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  # ------------------------------ Current Bus Owner --------------------------
  # def current_bus_owner
  #   BusOwner.find(session[:bus_owner_id]) if session[:bus_owner_id]
  # end
  
  # helper_method :current_bus_owner

  # --------------------------- Required Sign In -----------------------
  def required_signin
    unless current_user
      flash[:error] = "Please Sign In Properly"
      redirect_to root_path
    end
  end
  
  # ------------------------------ Required Sign Out ------------------------
  def required_signout
    if current_user
      flash[:error] = "Please Sign out Properly"
      redirect_to root_path
    end
  end

  def change_path
    params[:path]
    redirect_to params[:path]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gst_no, :license])
  end
  
end
