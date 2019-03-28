class RemoveGroupIdFromGroupsOrdersUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups_orders_users, :group_id, :integer
  end
end
