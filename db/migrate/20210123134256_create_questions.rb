class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :gr
      t.text :tekst

      t.timestamps
    end
  end
end
