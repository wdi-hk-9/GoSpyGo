class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.string :value

      t.timestamps null: false
    end
  end
end
