class AddDecksUsersTable < ActiveRecord::Migration
  def change
    create_table :decks_users do |d|
      d.integer :user_id
      d.integer :deck_id
    end
  end
end
