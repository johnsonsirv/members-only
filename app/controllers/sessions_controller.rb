class SessionsController < ApplicationController
  def new
  end
	
	def create
		member = User.find_by(username: params[:session][:username].downcase)
		
		if member && member.authenticate(username: params[:session][:password])
			
		else
			flash.now[:login_error] = "Incorrect username or password"
			render 'new'
		end
		
	end
	
	def destroy
	end
end
