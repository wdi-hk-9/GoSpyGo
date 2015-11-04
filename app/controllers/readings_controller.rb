# require 'time'

class ReadingsController < ApplicationController
  def index
    @readings = Reading.where(sensor_id: params[:sensor_id]).order(created_at: :desc)
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
    reading = Reading.new
    # reading = Reading.new(reading_params)
    # reading.value = params[:result].to_s
    reading.value = "30"
    reading.sensor = Sensor.find(params[:sensor_id])

    if reading.save
      render json: {msg: "reading created", time: reading.created_at}, status: 200
    else
      render json: {msg: "reading failed"}, status: 404
    end
  end

  private
    def reading_params
      params.require(:reading).permit(:value, :sensor_id)
    end
end
