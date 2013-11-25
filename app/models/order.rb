class Order < ActiveRecord::Base
	belongs_to :customer, class_name: "Customer", foreign_key: "customer_id"

	validate :validate_orders_nothing

	private

  def validate_orders_nothing
    if(whole_beef.blank? and half_beef.blank? and qtr_beef.blank? and bbq_hog.blank? and half_hog.blank? and whole_hog.blank? and chickens.blank? and lamb.blank? and bbq_pit.blank? and comments.blank?)

      errors.add(:base, "Oops! Looks like you didn't order anything!")
    end
  end

  def self.orders_this_month(from = (Date.today-1.month).beginning_of_day,to = Date.today.end_of_day)
    where(created_at: from..to).count
  end

  def self.orders_last_month(from = (Date.today-2.month).beginning_of_day,to = Date.today.end_of_day - 1.month)
    where(created_at: from..to).count
  end
  
end
