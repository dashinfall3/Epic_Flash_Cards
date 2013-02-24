class Deck < ActiveRecord::Base
  has_many :cards
  has_many :games
  has_and_belongs_to_many :users, :uniq => true
end
