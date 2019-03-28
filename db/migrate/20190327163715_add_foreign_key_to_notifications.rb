class AddForeignKeyToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :notifications, :users
  end
end
