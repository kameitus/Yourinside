class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.text :answer_1
      t.text :answer_2
      t.text :answer_3
      t.text :answer_4
      t.text :answer_5
      t.text :answer_6
      t.text :answer_7
      t.text :answer_8
      t.text :answer_9
      t.text :gakki
      t.text :item
      t.text :photo
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
