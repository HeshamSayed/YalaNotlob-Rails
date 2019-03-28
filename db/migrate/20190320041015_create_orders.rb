class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :meal
      t.string :restaurant_name
      t.integer :user_id
      t.string :menu_image
      t.boolean :status
      t.timestamps
    end
  end
end
