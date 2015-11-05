class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @sensors = Sensor.where(user_id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to '/', :flash =>{:success=> "Welcome to GoSpyGo! You can login to your account to play with the robots!"}
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
