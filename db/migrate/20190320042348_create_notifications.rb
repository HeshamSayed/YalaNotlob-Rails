class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :notification
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
