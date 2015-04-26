json.array!(@orders_pizzas) do |orders_pizza|
  json.extract! orders_pizza, :id, :order_id, :pizza_id
  json.url orders_pizza_url(orders_pizza, format: :json)
end
