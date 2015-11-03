class ChangeSensorColumnName < ActiveRecord::Migration
  def change
    rename_column :sensors, :type, :sensorType
  end
end
