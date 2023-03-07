json.extract! device, :id, :client_id, :kio_device_id, :unique_id, :device_type, :model, :product, :firmware, :order_id, :created_at, :updated_at
json.url device_url(device, format: :json)
