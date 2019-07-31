class User < ApplicationRecord
	has_secure_password
	
	has_many :posts
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :username, presence: {message: "Please choose a username"}, uniqueness: true, length: {maximum: 16, message: "Username too long. Maximum of 16 characters"}
	validates :password, presence: {message: "Please choose a password"},  length: {in: 8..16, message: "Password length too short or long. 8-16 characters"}
	validates :email, presence: {message: "Please enter a valid email"} 
	validates :email, format: { with: VALID_EMAIL_REGEX, message: "Please enter a valid email"  },
                    uniqueness: { case_sensitive: false }
	
	
end
