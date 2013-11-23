class Admin < ActiveRecord::Base
	has_many :customer_orders
	has_secure_password
end
