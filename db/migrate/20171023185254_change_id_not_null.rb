class ChangeIdNotNull < ActiveRecord::Migration[5.1]
  def change

  	change_column_null :houses, :user_id, false
  end
end
