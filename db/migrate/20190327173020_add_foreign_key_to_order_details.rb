class AddForeignKeyToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :order_details, :users
  end
end
