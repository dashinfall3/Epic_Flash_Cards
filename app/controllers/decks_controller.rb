get '/deck/new' do
  erb :decks_new
end

get '/decks' do
  @decks = Deck.all
  erb :decks
end

get '/decks/:id' do 
  @cards = Deck.find(params[:id]).cards
  erb :decks_show
end


