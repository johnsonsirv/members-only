class SessionsController < ApplicationController
  def new
  end
	
	def create
		member = User.find_by(username: params[:session][:username].downcase)
		
		if member && member.authenticate(username: params[:session][:password])
			log_in member
			redirect_to root_path
		else
			flash.now[:login_error] = "Incorrect username or password"
			render 'new'
		end
		
	end
	
	def destroy
		log_out
		redirect_to root_path
	end
	
end
