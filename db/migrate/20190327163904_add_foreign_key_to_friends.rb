class AddForeignKeyToFriends < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :friends, :users
  end
end
