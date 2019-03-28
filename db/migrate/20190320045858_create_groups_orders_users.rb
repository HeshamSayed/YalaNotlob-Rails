class CreateGroupsOrdersUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :groups_orders_users do |t|
      # t.integer :group_id
      t.integer :user_id
      # t.integer :order_id
      t.references :group, foreign_key: true
      t.references :order, foreign_key: true
      t.boolean :joined

      t.timestamps
    end
  end
end
