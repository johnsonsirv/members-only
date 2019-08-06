class SessionsController < ApplicationController
	before_action :is_already_logged_in, only: [:new]
  def new
		
  end
	
	def create
		member = User.find_by(username: params[:session][:username].downcase)
		
		if member && member.authenticate(params[:session][:password])
			log_in member
			redirect_to root_path
		else
			flash.now[:login_error] = "Incorrect username or password"
			render 'new'
		end
		
	end
	
	def destroy
		log_out
		redirect_to login_path
	end
	
	private
	def is_already_logged_in
		redirect_to root_path if logged_in?
	end
	
end
