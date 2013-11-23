class Order < ActiveRecord::Base
	has_and_belongs_to_many :customers, join_table: "customer_orders", class_name: "Customer", foreign_key: "order_id", association_foreign_key: "customer_id"

	validate :validate_orders_nothing

	private
  def validate_orders_nothing
    if(whole_beef.blank? and half_beef.blank? and qtr_beef.blank? and bbq_hog.blank? and half_hog.blank? and whole_hog.blank? and chickens.blank? and lamb.blank? and bbq_pit.blank? and comments.blank?)

      errors.add(:base, "Oops! Looks like you didn't order anything!")
    end
  end
end
