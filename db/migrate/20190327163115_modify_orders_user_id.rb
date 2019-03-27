class ModifyOrdersUserId < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :user_id, :bigint
  end
end
