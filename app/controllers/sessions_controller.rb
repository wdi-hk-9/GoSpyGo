class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_sensors_path(user.id)
    elsif user
      flash[:danger] = "Wrong Password. Please Login again or Sign Up Today"
      redirect_to '/'
    else
      flash[:danger] = "User Not Found. Not a member? Sign Up Today!"
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, noticed: "Logged out"
  end
end
