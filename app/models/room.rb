class Room < ApplicationRecord
  self.primary_key = "kio_room_id"
  belongs_to :client
  belongs_to :floor, foreign_key: "kio_floor_id"
end
