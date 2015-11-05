class SensorsController < ApplicationController
  before_action :user_authenticate, only:[:index, :show]

  def index
    @sensors = Sensor.where(user_id: params[:user_id])
    @readingArray = Hash.new
    @sensors.each do |sensor|
      @readingArray[sensor.id] = Reading.where(sensor_id: sensor.id).order(created_at: :desc).limit(5)
    end
  end

  def show
    @sensor = Sensor.find(params[:id])
  end
end
