class CustomerOrder < ActiveRecord::Base
	belongs_to :admin

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :phone, presence:true
	validates :address, presence:true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, numericality: {only_integer: true}

end
