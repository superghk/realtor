class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
    	t.integer :user_id, null: false
    	t.integer :house_id, null: false

    	t.timestamps null: false
    end

    add_index :notifications, :user_id
    add_index :notifications, :house_id
  end
end
