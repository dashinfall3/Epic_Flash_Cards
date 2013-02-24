post '/games/:id/guesses' do
  guess = Guess.new(:game_id => params[:game_id], :card_id => params[:card_id]) #game_id and #card_id
  guess.save
  card = Card.find(params[:card_id])
  @game = Game.find(params[:game_id])
  cards = @game.deck.cards
  if card.answer.downcase == params[:guess].downcase
    guess.update_attribute(:correct, true)
    @message = "you got it right :)"
  else
    guess.update_attribute(:correct, false)
    @message = "you got it wrong :("
  end

  @game.update_attribute(:current_card, @game.current_card + 1)
  @current_card = cards[@game.current_card]
  if @game.current_card == cards.length
    @game.update_attribute(:completed_at, Time.now)
    redirect to "/games/#{@game.id}/result"
  else 
    erb :game
  end
end



