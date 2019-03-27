class AddUniqueIndexToGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :groups_users, [:group_id, :member_id], unique: true
  end
end
