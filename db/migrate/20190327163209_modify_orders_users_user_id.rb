class ModifyOrdersUsersUserId < ActiveRecord::Migration[5.2]
  def change
    change_column :orders_users, :user_id, :bigint
  end
end
