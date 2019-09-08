class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :age
      t.string :gender
      t.string :area
      t.string :part
      t.string :category
      t.string :sns_1
      t.string :sns_2
      t.string :icon

      t.timestamps
    end
  end
end
