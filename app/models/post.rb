class Post < ApplicationRecord
	belongs_to :user
	
	validates :title, presence: true, length: {minimum: 1, maximum: 75}
	validates :body, length: {minimum: 1, maximum: 250}
	
end
