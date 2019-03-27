class ModifyNotificationsUserId < ActiveRecord::Migration[5.2]
  def change
    change_column :notifications, :user_id, :bigint
  end
end
