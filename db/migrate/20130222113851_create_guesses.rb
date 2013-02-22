class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer   :card_id
      t.integer   :game_id
      t.boolean   :correct
      t.timestamps
    end
  end
end
