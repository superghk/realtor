class FixColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :houses, :type, :house_type
  end
end
