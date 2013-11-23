json.array!(@customer_orders) do |customer_order|
  json.extract! customer_order, :first_name, :last_name, :email, :phone, :address, :city, :state, :zip, :whole_beef, :integer, :half_beef, :qtr_beef, :bbq_hog, :half_hog, :whole_hog, :chickens, :lamb, :bbq_pit, :comments
  json.url customer_order_url(customer_order, format: :json)
end
