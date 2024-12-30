class CreateEgzams < ActiveRecord::Migration[6.1]
  def change
    create_table :egzams do |t|
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
