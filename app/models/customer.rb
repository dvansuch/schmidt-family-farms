class Customer < ActiveRecord::Base
	has_many :orders, class_name: "Order", foreign_key: "customer_id"

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, :format => /@/
	validates :phone, presence:true
	validates :address, presence:true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, numericality: {only_integer: true}
end
