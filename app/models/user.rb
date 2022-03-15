class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, length: { maximum: 100 }
  validates :password_digest, length: { minimum: 8 }
  
  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email.downcase.strip)
    
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
