class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end

  private
  def user_params
     params.require(:user).permit(:id)
  end
end
