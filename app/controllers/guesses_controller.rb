post '/games/:id/guesses' do
  guess = Guess.new(:game_id => params[:game_id], :card_id => params[:card_id]) #game_id and #card_id
  guess.save
  card = Card.find(params[:card_id])
  if card.answer.downcase == params[:guess].downcase
    guess.update_attribute(:correct, true)
  else
    guess.update_attribute(:correct, false)
  end
  game = Game.find(params[:game_id])
  game.update_attribute(:current_card, game.current_card + 1)
  redirect to "/games/#{game.id}"
end



