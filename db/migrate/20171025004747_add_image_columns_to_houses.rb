class AddImageColumnsToHouses < ActiveRecord::Migration[5.1]

  def up
  	add_attachment :houses, :image
  end

  def down
  	remove_attachement :houses, :image
  end
end
