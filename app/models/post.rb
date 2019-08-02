class Post < ApplicationRecord
	belongs_to :user
	
	validates :title, presence: true, length: {minimum: 1, maximum: 50}
	validates :body, length: {minimum: 1, maximum: 250}
	
	def hottest_first
		#get posts, hotest first
		
	end
end
