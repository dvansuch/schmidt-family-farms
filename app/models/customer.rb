class Customer < ActiveRecord::Base
	has_and_belongs_to_many :orders, join_table: "customer_orders", class_name: "Order", foreign_key: "customer_id", association_foreign_key: "order_id"

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, :format => /@/
	validates :phone, presence:true
	validates :address, presence:true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, numericality: {only_integer: true}
end
