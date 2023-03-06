json.extract! room, :id, :client_id, :room_id, :name, :floor_name, :building_name, :created_at, :updated_at
json.url room_url(room, format: :json)
