class Client < ApplicationRecord
  has_many :rooms
  has_many :buildings, foreign_key: 'kio_building_id'
end
