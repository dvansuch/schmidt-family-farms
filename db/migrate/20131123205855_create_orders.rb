class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
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
