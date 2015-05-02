json.array!(@clients) do |client|
  json.extract! client, :id, :name, :lastname, :phone_number, :address
  json.url client_url(client, format: :json)
end