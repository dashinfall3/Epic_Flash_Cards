class AddCreatedByColumnToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :created_by, :integer
  end
end
