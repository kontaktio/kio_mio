json.extract! presence, :id, :kio_room_id, :kio_device_id, :start_time, :end_time, :duration, :created_at, :updated_at
json.url presence_url(presence, format: :json)
