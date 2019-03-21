class CreateGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :groups_users do |t|
      # t.integer :group_id
      t.integer :user_id
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
