json.array!(@farm_customers) do |farm_customer|
  json.extract! farm_customer, 
  json.url farm_customer_url(farm_customer, format: :json)
end
