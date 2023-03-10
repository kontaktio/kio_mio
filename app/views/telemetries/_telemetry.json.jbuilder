json.extract! telemetry, :id, :tracking_id, :timestamp, :battery_level, :channel, :humidity, :light, :rssi, :temperature, :air_quality, :firmware, :model, :moving, :client_id, :created_at, :updated_at
json.url telemetry_url(telemetry, format: :json)
