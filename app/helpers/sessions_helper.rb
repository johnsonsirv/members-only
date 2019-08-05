module SessionsHelper
	
	def log_in(member)
		session[:logged_member] = member.id
		session[:logged_time] = Time.now
	end
	
	def logged_in?
		current_user && session[:logged_time]
	end
	
	def current_user
		@current_user ||= User.find_by(id: session[:logged_member]) if session[:logged_member]
	end
	
	def log_out
		session[:logged_member] = nil
		session[:logged_time] = nil
	end
end
