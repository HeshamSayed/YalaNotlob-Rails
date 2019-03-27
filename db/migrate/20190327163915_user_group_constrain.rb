class UserGroupConstrain < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :groups_users, :groups
    add_foreign_key :groups_users, :groups, on_delete: :cascade
  end
end
