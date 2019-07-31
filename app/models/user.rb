class User < ApplicationRecord
	has_secure_password
	
	has_many :posts
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :username, presence: true, uniqueness: true, length: {in: 8..16}
	validates :password, presence: true,  length: {in: 8..16}
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	
end
