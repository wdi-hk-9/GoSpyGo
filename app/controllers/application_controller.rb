class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :fetch_sensor_image

  def fetch_sensor_image(sensorType)
    sensorArray = {
      'light': "light.png",
      'temperature': "temp.png"
    }

    sensorArray[sensorType.to_sym]
  end
end
