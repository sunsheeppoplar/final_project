class RemoveDefFromFlashcards < ActiveRecord::Migration
  def change
    remove_column :flashcards, :def, :text
  end
end
