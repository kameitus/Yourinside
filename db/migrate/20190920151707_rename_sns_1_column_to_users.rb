class RenameSns1ColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :sns_1, :twitter
    rename_column :users, :sns_2, :facebook
  end
end
