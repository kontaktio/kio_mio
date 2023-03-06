class Floor < ApplicationRecord
  # belongs_to :building, foreign_key: 'kio_building_id'
  # has_one :client, through: :building
  # has_many :rooms, foreign_key: 'kio_floor_id'
end
