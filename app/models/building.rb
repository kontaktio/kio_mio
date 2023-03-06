class Building < ApplicationRecord
  belongs_to :client
  has_many :floors, foreign_key: 'kio_building_id'
end
