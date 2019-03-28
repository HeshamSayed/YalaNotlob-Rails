class AddUserOrderConstrain < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :orders_users, :orders
    add_foreign_key :orders_users, :orders, on_delete: :cascade

  end
end
