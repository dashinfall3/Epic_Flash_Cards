require_relative '../helpers/game.rb' #why do I have to require this in order for 
                                    # the calculate_time method on line 28 to work?
post '/games/new' do
  new_game = Game.new(params)
  #takes in 2 hidden inputs, user_id and deck_id
  new_game.save!
  redirect to "games/#{new_game.id}"
end

get '/games/:id' do
  #User profile
  params.to_json
  @game = Game.find(params[:id])
  deck = @game.deck
  cards = deck.cards
  #get cards into an array
  puts cards.inspect
  @current_card = cards[@game.current_card]
  if @game.current_card == cards.length
    @game.update_attribute(:completed_at, Time.now)
    redirect to "/games/#{@game.id}/result"
  else 
    erb :game
  end
end

get '/games/:id/result' do
  @game = Game.find(params[:id])
  @time_notification = calculate_time(@game.completed_at - @game.created_at)
  @correct_count = @game.guesses.where("correct = ?", true).length
  erb :result
end
