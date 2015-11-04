class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_sensors_path(user.id), notice: "logged in!"
    elsif user
      flash.now.alert = "Wrong Password"
      render 'new'
    else
      flash.now.alert = "User Not Found"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, noticed: "Logged out"
  end
end
