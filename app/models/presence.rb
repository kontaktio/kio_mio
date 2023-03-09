class Presence < ApplicationRecord
  belongs_to :room, foreign_key: 'kio_room_id'
  belongs_to :device, foreign_key: 'kio_device_id'

  def device_duration
    if self.end_time.present?
      seconds = self.end_time - self.start_time
      return seconds / 60
    end
  end
end
