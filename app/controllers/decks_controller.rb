get '/decks/new' do
  erb :decks_new
end

get '/decks' do
  @decks = Deck.all
  erb :decks
end

post '/decks' do
  deck = Deck.new(:name => params[:name],
                  :created_by => session[:user_id])
  deck.users << User.find(session[:user_id])
  puts deck.inspect
  deck.save
  redirect to("/decks/#{deck.id}")
end

get '/decks/:id' do 
  @deck = Deck.find(params[:id])
  @cards = @deck.cards
  erb :decks_show
end


post '/decks/:id/cards' do
  Card.create(:question => params[:question],
              :answer   => params[:answer],
              :deck_id  => params[:id])
  redirect to("/decks/#{params[:id]}")
end
