class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :delete]
	
	def index
		if logged_in?
			@post = Post.joins(:user).select(:id, :title, :body, :username)
		else
			@post = Post.select(:title, :body)
		end
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
		Post.find_by(params[:id]).destroy
		flash[:message] = "Post Deleted"
		redirect_to posts_path
	end
	
	private
		def authenticate_user
			unless logged_in?
				flash[:login_error] = "Please log in"
				redirect_to login_path
			end
		end

		def post_params
			params.require(:post).permit(:title, :body)
		end
	
		def is_post_author?(user)
			
		end

end
