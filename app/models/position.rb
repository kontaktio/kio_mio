class Position < ApplicationRecord
  belongs_to :room, foreign_key: 'kio_room_id'

  def device
    Device.find_by(kio_device_id: self.kio_device_id)
  end
end
