post '/games/:id/guesses' do
  guess = Guess.create(:game_id => params[:game_id], :card_id => params[:card_id]) #game_id and #card_id
  card = Card.find(params[:card_id])
  if card.check_answer(params[:guess]) 
    guess.is_correct
    session[:question_result] = "Correct!"
  else 
    guess.is_incorrect
    session[:question_result] = "Incorrect."
  end
  game = Game.find(params[:game_id])
  game.update_attribute(:current_card, game.current_card + 1)
  redirect to "/games/#{game.id}"
end



