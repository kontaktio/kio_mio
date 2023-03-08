class CreatePresences < ActiveRecord::Migration[7.0]
  def change
    create_table :presences do |t|
      t.integer :kio_room_id
      t.string :kio_device_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration

      t.timestamps
    end
  end
end
