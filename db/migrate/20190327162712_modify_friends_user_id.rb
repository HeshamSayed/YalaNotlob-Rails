class ModifyFriendsUserId < ActiveRecord::Migration[5.2]
  def change
    change_column :friends, :user_id, :bigint
  end
end
