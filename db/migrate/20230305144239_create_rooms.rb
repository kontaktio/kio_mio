class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :client_id
      t.integer :kio_room_id
      t.string :name
      t.integer :kio_floor_id
      t.integer :kio_building_id

      t.timestamps
    end
  end
end
