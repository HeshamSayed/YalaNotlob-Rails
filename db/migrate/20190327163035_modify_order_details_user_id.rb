class ModifyOrderDetailsUserId < ActiveRecord::Migration[5.2]
  def change
    change_column :order_details, :user_id, :bigint
  end
end
