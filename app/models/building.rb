class Building < ApplicationRecord
  self.primary_key = "kio_building_id"

  belongs_to :client
  has_many :floors, foreign_key: 'kio_building_id'
end
