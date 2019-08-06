# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :required_user_signout, only:[:new, :create]
  before_action :required_user_signin, only:[:destroy]

  # before_action :confirequired_signoutgure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
