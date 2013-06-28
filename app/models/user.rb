class User < ActiveRecord::Base
  before_save{ self.email = email.downcase }
  before_save :create_remember_token

  #validations
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  #password confirmation
  has_secure_password
  validates :password_confirmation, presence:true
  validates :password, length: { minimum: 6 }    #presence is automatically validate in has_secure_password

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end