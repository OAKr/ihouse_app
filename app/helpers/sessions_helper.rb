module SessionsHelper
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = { value: remember_token, expires: 1.year.from_now }
											 #allows the manipulation of browser cookie like hashses
		user.update_attribute(:remember_token, User.digest(remember_token)) #update attribute updates
																			#user info without password
		self.current_user = user
	end

	def signed_in?
		!current_user.nil? #recall the ! is the not operator
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
	 	remember_token = User.digest(cookies[:remember_token])
	 	@current_user ||= User.find_by(remember_token: remember_token) #||= or equal
	end

	def sign_out
	    current_user.update_attribute(:remember_token,
	                                  User.digest(User.new_remember_token))
	    cookies.delete(:remember_token)
	    self.current_user = nil
  	end	
end
