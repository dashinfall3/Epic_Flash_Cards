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
  deck.users << User.find(current_user.id)
  deck.save
  redirect to("/decks/#{deck.id}")
end

get '/decks/:id' do 
  @deck = Deck.find(params[:id])
  @cards = @deck.cards
  erb :decks_show
end

post '/decks/:id/cards' do
  content_type :json
  @card = Card.create(:question => params[:question],
                      :answer   => params[:answer],
                      :deck_id  => params[:id])
  
  { :question => @card.question, :answer => @card.answer }.to_json
end

delete '/decks/:id' do
  user = User.find(session[:user_id])
  user.decks.destroy params[:id]
  redirect to("/users/#{current_user.id}")
end

# post '/decks/:id/cards' do
#   Card.create(:question => params[:question],
#               :answer   => params[:answer],
#               :deck_id  => params[:id])
#   redirect to("/decks/#{params[:id]}")
# end
