class SensorsController < ApplicationController
  def index
    @sensors = Sensor.all
  end

  def show
  end
end
