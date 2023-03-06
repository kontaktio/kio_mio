class Room < ApplicationRecord
  belongs_to :client
  # belongs_to :floor, foreign_key: "kio_floor_id"
end
