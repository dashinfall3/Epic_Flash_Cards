configure do
  enable :sessions
end

post '/users/new' do
  #Create and save new user
  new_user = User.new(params)
  new_user.save!
  session[:user_id] = User.authenticate(new_user.email, new_user.password)
  current_user
  redirect to "users/#{new_user.id}"
end

post '/users/login' do
  session[:user_id] = User.authenticate(params[:email], params[:password])
  if current_user
    redirect to "/users/#{current_user.id}"
  else
    erb :index
  end
end

get '/users/:id' do
  #User profile
  @user = User.find(params[:id])
  @games = @user.games
  @decks = Deck.all
  erb :users_show
end

get '/logout' do
  session.clear
  redirect '/'
end


def current_user
  @user ||= User.find(session[:user_id]) if session[:user_id]
end










#methods to be put in model
# before_save :encrypt_password

# def hash_password
#   self.password = Digest::MD5.hexdigest(self.password)
# end

# def authenticate(email, password)
#   password = Digest::MD5.hexdigest(password)
#   user = User.find_by_email(email)
#   if user == nil
#     false     #email incorrect
#   elsif password == user.password
#     return user.id
#   else
#     false     #email is correct, password is incorrect
#   end
# end



