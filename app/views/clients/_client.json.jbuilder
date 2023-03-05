json.extract! client, :id, :name, :api_key, :user, :pass, :created_at, :updated_at
json.url client_url(client, format: :json)
