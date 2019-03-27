class AddForeignKeyToOrdersUsers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :orders_users, :users
  end
end
