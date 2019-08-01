class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  # def edit
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to users_url, notice: 'Account Successfully Updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: 'Account was successfully removed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  # def user_params
    
  # end
end
