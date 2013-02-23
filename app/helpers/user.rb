helpers do 

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate(email, password)
    password = Digest::MD5.hexdigest(password)
    user = User.find_by_email(email)
    puts user
    if user.nil?
      puts "email incorrect"
      false     #email incorrect
    elsif password == user.password
      return user.id
    else
      puts "password wrong"
      puts "#{password}"
      false     #email is correct, password is incorrect
    end
  end

  def nameify(name)
    name.split ' '.map { |name| name.capitalize }.join ' '
  end

end
