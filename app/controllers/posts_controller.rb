class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy]
	
	def index
		
  end
	
	def new
		
  end
	
	def create
		
	end
	
	def destroy
		
	end
	
	def authenticate_user
		unless logged_in?
			flash[:login_error] = "Please log in"
			redirect_to login_path
		end
	end
			

end
