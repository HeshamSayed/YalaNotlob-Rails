class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.string :item
      t.integer :amount
      t.integer :price
      t.text :comments
      t.integer :user_id
      # t.integer :order_id
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
