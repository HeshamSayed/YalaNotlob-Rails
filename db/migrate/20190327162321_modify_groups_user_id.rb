class ModifyGroupsUserId < ActiveRecord::Migration[5.2]
  def change
    change_column :groups, :user_id, :bigint
  end
end
