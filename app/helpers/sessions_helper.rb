module SessionsHelper
	
	def log_in(member)
		session[:logged_member] = member.id
		session[:logged_time] = Time.now
	end
end
