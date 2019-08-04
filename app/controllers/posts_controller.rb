class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy]
	
	def index
		if logged_in?
			@post = Post.joins(:user).select(:id, :title, :body, :username, :user_id)
		else
			@post = Post.select(:title, :body)
		end
		render :index
  end
	
	def new
		@post = Post.new
  end
	
	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:message] = "New Post succesfuly added"
			redirect_to posts_path
		else
			render :new
		end
	end
	
	def destroy
		@post.destroy
		flash[:message] = "Post Deleted"
		redirect_to posts_path
	end
	

	
	private
		def authenticate_user
			unless logged_in?
				redirect_to posts_path
			end
		end

		def post_params
			params.require(:post).permit(:title, :body)
		end
	
end
