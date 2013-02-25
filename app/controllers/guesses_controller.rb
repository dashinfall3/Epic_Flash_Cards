post '/games/:id/guesses' do
  content_type :json
  guess = Guess.create(:game_id => params[:game_id], :card_id => params[:card_id]) #game_id and #card_id
  card = Card.find(params[:card_id])
  if card.check_answer(params[:guess]) 
    guess.is_correct
    session[:question_result] = "Correct!"
  else 
    guess.is_incorrect
    session[:question_result] = "Incorrect."
  end
  session[:previous_answer] = card.answer
  game = Game.find(params[:game_id])
  game.update_attribute(:current_card, game.current_card + 1)
  #game, current_card, previous_answer
  hash ={}
  correct_count = game.guesses.where("correct = ?", true).length
  percent_correct = (correct_count.to_f / game.current_card.to_f) * 100
  if game.current_card == game.deck.cards.length
    hash={}
    game.update_attribute(:completed_at, Time.now)
    time_notification = calculate_time(game.completed_at - game.created_at)
    puts "end of game"
    hash[:results] = game
    hash[:time_notification] = time_notification
    hash[:correct_count] = correct_count
    hash[:percent_correct] = percent_correct
    p hash.to_json
    hash.to_json
  else
    hash[:card] = game.deck.cards[game.current_card - 1]
    hash[:game] = game
    hash[:current_card] = game.deck.cards[game.current_card]
    hash[:percent_correct] = percent_correct
    p hash.to_json
    hash.to_json
  end


end



