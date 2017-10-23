class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :type
      t.integer :bathroom
      t.integer :room
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
