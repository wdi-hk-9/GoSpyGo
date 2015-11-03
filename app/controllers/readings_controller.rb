# require 'time'

class ReadingsController < ApplicationController
  def index
    @readings = Reading.where(sensor_id: params[:sensor_id])
    @sensor = Sensor.find(params[:sensor_id])
    @user = User.find(params[:user_id])
  end

  def show
    @reading = Reading.find(params[:id])
  end

  def new
    @reading = Reading.new
    @sensor = Sensor.find(params[:sensor_id])
    @user = User.find(params[:user_id])
    @time = Time.now
  end

  def create
    @reading = Reading.create(reading_params)
    @reading.sensor = Sensor.find(params[:sensor_id])
    if @reading.save
      redirect_to "readings#index"
    end
  end

  private
    def reading_params
      params.require(:reading).permit(:value, :sensor)
    end
end
