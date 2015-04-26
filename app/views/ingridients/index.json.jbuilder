json.array!(@ingridients) do |ingridient|
  json.extract! ingridient, :id, :name, :price
  json.url ingridient_url(ingridient, format: :json)
end
