class ChangeDataTitleText < ActiveRecord::Migration[5.2]
  def up
   change_column :interviews, :title, :text
  end
  
  def down
    change_column :interviews, :title, :string
  end
end
