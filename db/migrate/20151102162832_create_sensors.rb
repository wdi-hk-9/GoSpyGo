class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
