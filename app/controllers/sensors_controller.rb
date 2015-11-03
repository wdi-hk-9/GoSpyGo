class SensorsController < ApplicationController
  def index
    @sensors = Sensor.where(user_id: params[:user_id])
  end

  def show
    @sensor = Sensor.find(params[:id])
  end
end
