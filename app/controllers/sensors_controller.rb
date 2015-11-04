class SensorsController < ApplicationController
  before_action :user_authenticate, only:[:index, :show]

  def index
    @sensors = Sensor.where(user_id: params[:user_id])
  end

  def show
    @sensor = Sensor.find(params[:id])
  end
end
