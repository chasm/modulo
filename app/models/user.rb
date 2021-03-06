require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :name, :email, :password, :password_confirmation
  
  attr_accessor :password, :password_confirmation
  
  field :name, type: String
  field :email, type: String
  
  field :hashed, type: String
  field :salt, type: String
  
  field :code, type: String
  field :expires_at, type: Time
  
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  
  before_validation :downcase_email
  before_save :encrypt_password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.hashed == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end
  
  def authenticate(password)
    if self.hashed == BCrypt::Engine.hash_secret(password, self.salt)
      self
    else
      nil
    end
  end
  
  private
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed = BCrypt::Engine.hash_secret(password, self.salt)
      self.password = nil
    end
  end
  
  def downcase_email
    self.email.downcase!
  end
  
end
