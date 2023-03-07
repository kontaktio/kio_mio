class Floor < ApplicationRecord
  self.primary_key = "kio_floor_id"
  belongs_to :building, class_name: "Building", foreign_key: 'kio_building_id'
  has_one :client, through: :building
  has_many :rooms, foreign_key: 'kio_floor_id'
end
