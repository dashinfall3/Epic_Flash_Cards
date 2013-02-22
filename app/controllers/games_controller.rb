post '/games/new' do
  new_game = Game.new(params)
  #takes in 2 hidden inputs, user_id and deck_id
  new_game.save!
  redirect to "games/#{new_game.id}"
end

get '/games/:id' do
  #User profile
  @game = Game.find(params[:id])
  deck = @game.deck
  cards = deck.cards
  #get cards into an array
  @current_card = cards[@game.current_card]
  erb :game
end

get '/games/:id/result' do

end
