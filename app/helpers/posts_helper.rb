module PostsHelper
	
	def is_post_author?(post)
		if logged_in?
			post.user_id == current_user.id
		end
	end
end
