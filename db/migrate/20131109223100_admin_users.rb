class AdminUsers < ActiveRecord::Migration
  def change
    create_table :admin do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_digest
    end
  end
end
