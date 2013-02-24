before do
  @message = {}
end

after do
  @message.delete :notice
end

configure do
  enable :sessions
end

post '/users/new' do
  #Create and save new user
  if params[:password] == params[:password_confirmation]
    @new_user = User.new( :name => params[:name],
                          :email => params[:email],
                          :password => params[:password])
    if @new_user.save
      session[:user_id] = authenticate(@new_user.email, params[:password])
      redirect to "/users/#{@new_user.id}"
    else
      erb :index
    end
  else
    @message[:notice] = "Password doesn't match. Please try again."
    erb :index
  end
end

post '/users/login' do
  session[:user_id] = authenticate(params[:email], params[:password])
  if current_user
    redirect to "/users/#{current_user.id}"
  else
    erb :index
  end
end

post '/users/:id'do 
  @user = User.find(params[:id])
  params["decks"].values.flatten.each do |deck_id|
    @user.decks << Deck.find(deck_id)
  end
  @user.save
  redirect to("/users/#{session[:user_id]}")
end  

get '/users/:id' do
  #User profile
  @user = User.find(params[:id])
  @games = @user.games
  @decks = @user.decks
  @name = @user.name.split(' ').map { |name| name.capitalize }.join ' '
  if session[:user_id] == @user.id
    erb :users_me
  else
    erb :users_show
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/user_delete' do
  @user = Post.find(params[:id])
  @user.destroy
  redirect to ('/')
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



