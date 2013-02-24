class User < ActiveRecord::Base  
  has_many :games
  has_and_belongs_to_many :decks

  validates :name, :presence => true
  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => { :with => /\S+[@]\S+[.]\w{2,3}/,
                                 :message => "needs a valid format dude!"}

  validates :password, :presence => true


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

end
