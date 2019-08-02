module SessionsHelper
	
	def log_in(member)
		session[:logged_member] = member.id
		session[:logged_time] = Time.now
	end
	
	def logged_in?
		session[:logged_member] && session[:logged_time]
	end
	
	def current_user
		if logged_in?
			 @current_user ||= User.find_by(id: session[:logged_member])
		end
		
	end
	
	def log_out
		session[:logged_member] = nil
		session[:logged_time] = nil
	end
end
