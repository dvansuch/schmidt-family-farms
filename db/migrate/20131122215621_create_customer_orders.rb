class CreateCustomerOrders < ActiveRecord::Migration
  def change
    create_table :customer_orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :whole_beef
      t.integer :half_beef
      t.integer :qtr_beef
      t.integer :bbq_hog
      t.integer :half_hog
      t.integer :whole_hog
      t.integer :chickens
      t.integer :lamb
      t.boolean :bbq_pit
      t.string :comments

      t.timestamps
    end
  end
end
