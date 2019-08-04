class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy]
	
	def index
		@posts = Post.order(created_at: :desc)
  end
	
	def new
		@post = Post.new
  end
	
	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			flash[:message] = "New Post succesfuly added"
			redirect_to posts_path
		else
			render :new
		end
	end
	
	def destroy
		Post.find_by(id: params[:id]).destroy
		flash[:message] = "Post Deleted"
		redirect_to posts_path
	end
	

	
	private
		def authenticate_user
			redirect_to posts_path unless logged_in?
		end

		def post_params
			params.require(:post).permit(:title, :body)
		end
	
end
