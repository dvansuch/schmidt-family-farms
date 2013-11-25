class CreateFarmCustomers < ActiveRecord::Migration
  def change
    create_table :farm_customers do |t|

      t.timestamps
    end
  end
end
