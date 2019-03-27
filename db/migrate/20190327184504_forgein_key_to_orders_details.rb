class ForgeinKeyToOrdersDetails < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :order_details, :orders
    add_foreign_key :order_details, :orders, on_delete: :cascade

  end
end
