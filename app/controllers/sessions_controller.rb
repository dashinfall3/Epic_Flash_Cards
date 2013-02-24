get '/logout' do
  session.clear
  redirect '/'
end

post '/users/login' do
  session[:user_id] = authenticate(params[:email], params[:password])
  if current_user
    redirect to "/users/#{current_user.id}"
  else
    erb :index
  end
end