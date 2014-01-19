class Customer < ActiveRecord::Base
	has_many :orders, class_name: "Order", foreign_key: "customer_id"

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, :format => /@/
	validates :phone, presence:true, length: { maximum: 13 }
	validates :address, presence:true, length: { minimum: 11}
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, numericality: {only_integer: true }, length: { is: 5 } 
end
