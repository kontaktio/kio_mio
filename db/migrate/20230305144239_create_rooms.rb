class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :client_id
      t.integer :room_id
      t.string :name
      t.string :floor_name
      t.string :building_name

      t.timestamps
    end
  end
end
