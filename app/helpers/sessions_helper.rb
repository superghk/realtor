module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end


	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end
	  # Returns true if the given user is the current user.
 	def current_user?(user)
   	 	user == current_user
 	end

	def current_user_houses
		@current_user_house ||= @current_user.houses #House.find_by(user_id: session[:user_id])
	end

	def has_house?
		current_user.houses.any?
	end
	
	def user_is_logged_in
    	unless logged_in?
    		flash[:danger] = "Please log in."
    		redirect_to login_url
    	end
    end

	def is_current_user_seller?
		current_user.role == "Seller"
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	  # Redirects to stored location (or to the default).
	def redirect_back_or(default)
	   redirect_to(session[:forwarding_url] || default)
	   session.delete(:forwarding_url)
	end

	  # Stores the URL trying to be accessed.
	def store_location
	   session[:forwarding_url] = request.original_url if request.get?
	end
end
