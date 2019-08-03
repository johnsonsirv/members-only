class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy]
	
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
		@post = current_user.posts.build(title: params[:title], body: params[:body])
		if post.save
			flash[:message] = "New Post succesfuly added"
			redirect_to @post
		else
			render :new
		end
	end
	
	def destroy
		Post.find_by(params[:id]).destroy
		flash[:message] = "Post Deleted"
		redirect_to posts_path
	end
	
	def authenticate_user
		unless logged_in?
			flash[:login_error] = "Please log in"
			redirect_to login_path
		end
	end
	
	private
	
		
		
		def is_current_user?(user)
		end

end
