class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.integer :client_id
      t.string :kio_device_id
      t.string :unique_id
      t.string :device_type
      t.string :model
      t.string :product
      t.string :firmware
      t.string :order_id
      t.datetime :last_seen
      t.string :mac
      t.string :deployment_status
      t.json :telemetry_fields
      t.integer :battery_level
      t.timestamps
    end
  end
end
