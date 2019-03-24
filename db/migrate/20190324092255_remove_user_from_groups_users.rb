class RemoveUserFromGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups_users, :user_id, :integer
  end
end
