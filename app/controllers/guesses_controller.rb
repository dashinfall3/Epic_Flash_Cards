post '/games/:id/guesses'
  guess = Guess.new(params) #game_id and #card_id
  guess.save!
  card = Card.find(params[:card_id])
  if card.answer == answer
    card.update_attribute(:correct, true)
  else
    card.update_attribute(:correct, false)
  end
  game = Game.find(params[:game_id])
  game.update_attribute(:current_card, game.current_card + 1)
  redirect to "/games/#{game.id}"

end



