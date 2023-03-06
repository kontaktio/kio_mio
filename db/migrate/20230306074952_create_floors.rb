class CreateFloors < ActiveRecord::Migration[7.0]
  def change
    create_table :floors do |t|
      t.integer :client_id
      t.integer :kio_floor_id
      t.string :name
      t.integer :kio_building_id

      t.timestamps
    end
  end
end
