json.array!(@ingridients_pizzas) do |ingridients_pizza|
  json.extract! ingridients_pizza, :id, :pizza_id, :ingridient_id
  json.url ingridients_pizza_url(ingridients_pizza, format: :json)
end
