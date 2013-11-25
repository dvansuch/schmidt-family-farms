json.array!(@farm_orders) do |farm_order|
  json.extract! farm_order, 
  json.url farm_order_url(farm_order, format: :json)
end
