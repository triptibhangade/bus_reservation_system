class Admin::UsersController < ApplicationController

  def index
    @users =  User.all.where(role: "customer")
  end

  def show
    @user = current_user
  end

end
