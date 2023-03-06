class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.integer :kio_building_id
      t.string :name
      t.string :address
      t.integer :client_id
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
