class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
  
    change_column :clients, :phone_number, :text
  
  end
end
