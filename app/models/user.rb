class User < ApplicationRecord
	has_secure_password
	
	has_many :posts
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :username, presence: true, uniqueness: true, length: {in: 8..16}
	validates :password, presence: true,  length: {in: 8..16}, message: "Please choose a password"
	validates :email, presence: true, message: "Please enter a valid email"
	validates :email, :format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, message: "Please enter a valid email"
	
	
end
