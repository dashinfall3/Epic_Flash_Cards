post '/games/:id/guesses' do
  content_type :json
  @guess = Guess.create(:game_id => params[:game_id], :card_id => params[:card_id]) #game_id and #card_id
  card = Card.find(params[:card_id])
  if card.check_answer(params[:guess]) 
    @guess.is_correct
    session[:question_result] = "Correct!"
  else 
    @guess.is_incorrect
    session[:question_result] = "Incorrect."
  end

  game = Game.find(params[:game_id])
  game.update_attribute(:current_card, game.current_card + 1)
  cards = game.deck.cards
  @current_card = cards[game.current_card]
  if game.current_card == cards.length
    game.update_attribute(:completed_at, Time.now)
  end
  {guess: @guess, current_card: @current_card}.to_json
end



