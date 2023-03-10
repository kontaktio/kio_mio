class CreateTelemetries < ActiveRecord::Migration[7.0]
  def change
    create_table :telemetries do |t|
      t.string :tracking_id
      t.string :timestamp
      t.integer :battery_level
      t.integer :channel
      t.integer :humidity
      t.integer :light
      t.integer :rssi
      t.float :temperature
      t.integer :air_quality
      t.string :firmware
      t.integer :model
      t.boolean :moving
      t.integer :client_id

      t.timestamps
    end
  end
end
