require 'securerandom'
require 'valid_email'
class User < ActiveRecord::Base
  
  has_many :saved_airports
	
	validates :name, presence: true, length: { maximum: 50,
		too_long: "max val is 50"}
	validates :email, uniqueness: true, presence: true, email: true, length: { maximum: 225,
		too_long: "max val is 225"}

	has_secure_password 
	validates :password, length: { minimum: 6 }

  def self.from_google(auth)
    create! do |user|
      user.name = auth.info.nickname
      user.uid = auth.uid
      user.google_token = auth.credentials.token
      user.google_secret = auth.credentials.secret
      user.password = SecureRandom.hex
      end
    end
end
