require 'valid_email'
class User < ActiveRecord::Base
  
  has_many :saved_airports
	
	validates :name, presence: true, length: { maximum: 50,
		too_long: "max val is 50"}
	validates :email, uniqueness: true, presence: true, email: true, length: { maximum: 225,
		too_long: "max val is 225"}

	has_secure_password 
	validates :password, length: { minimum: 6 }
end
