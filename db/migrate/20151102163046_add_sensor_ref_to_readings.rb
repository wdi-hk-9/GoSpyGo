class AddSensorRefToReadings < ActiveRecord::Migration
  def change
    add_reference :readings, :sensor, index: true, foreign_key: true
  end
end
