class Guess < ActiveRecord::Base
  belongs_to :game

  def is_correct
    self.update_attribute(:correct, true)
  end

  def is_incorrect
    self.update_attribute(:correct, false)
  end
  
end
