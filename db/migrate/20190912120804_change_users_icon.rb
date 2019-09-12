class ChangeUsersIcon < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :icon, :text
  end
  
  def down
    change_column :users, :icon, :string
  end
end
