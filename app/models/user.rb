class User < ActiveRecord::Base  
  has_many :games



# include BCrypt

# def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

before_save :hash_password

def hash_password
  self.password = Digest::MD5.hexdigest(self.password)
end

def self.authenticate(email, password)
  password = Digest::MD5.hexdigest(password)
  user = User.find_by_email(email)
  if user == nil
    false     #email incorrect
  elsif password == user.password
    return user.id
  else
    false     #email is correct, password is incorrect
  end
end



end
