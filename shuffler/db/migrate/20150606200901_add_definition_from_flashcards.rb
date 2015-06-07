class AddDefinitionFromFlashcards < ActiveRecord::Migration
  def change
    add_column :flashcards, :defin, :text
  end
end
