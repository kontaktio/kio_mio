class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.integer :kio_room_id
      t.float :x
      t.float :y
      t.datetime :kio_timestamp
      t.string :kio_device_id

      t.timestamps
    end
  end
end
