class ChangeGroupsOrdersUsersToOrdersUsers < ActiveRecord::Migration[5.2]
  def change
      rename_table :groups_orders_users, :orders_users
  end
end
