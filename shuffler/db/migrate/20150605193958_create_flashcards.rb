class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.text :chinese
      t.text :pinyin
      t.text :def
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
