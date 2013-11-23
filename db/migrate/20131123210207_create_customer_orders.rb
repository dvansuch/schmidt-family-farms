class CreateCustomerOrders < ActiveRecord::Migration
  def change
    create_table :customer_orders, id:false do |t|
      t.integer :customer_id
      t.integer :order_id

      t.timestamps
    end
  end
end
