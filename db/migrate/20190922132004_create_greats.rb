class CreateGreats < ActiveRecord::Migration[5.2]
  def change
    create_table :greats do |t|
      t.references :user, foreign_key: true
      t.references :interview, foreign_key: { to_table: :users }

      t.timestamps
      
      t.index [:user_id,:interview_id],unique: true
    end
  end
end
