class Card < ActiveRecord::Base
  belongs_to :deck

  def check_answer(guess)
    self.answer.downcase == guess.downcase ? true : false
  end

end
