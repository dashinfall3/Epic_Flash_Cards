class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer     :user_id
      t.integer     :deck_id
      t.integer     :current_card, :default => 0
      t.datetime    :completed_at
      t.timestamps
    end
  end
end
