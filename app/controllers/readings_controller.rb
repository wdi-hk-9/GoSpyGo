class ReadingsController < ApplicationController
  def index
    @readings = Reading.all
  end

  def show
  end

  def new
    @reading = Reading.new
    @sensor = Sensor.find(params[:sensor_id])
  end

  def create
    @reading = Reading.create(reading_params)
    @reading.sensor = Sensor.find(params[:sensor_id])
    @reading.save
    redirect_to "index"
  end

  private
    def reading_params
      params.require(:reading).permit(:value, :sensor)
    end
end
