class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	

	 def require_user
	  if session[:user_id]		
	  	@current_user=User.find(session[:user_id])
	  	else
	  		#if no user logged in go to log in page
	  		redirect_to login_path
	  		flash[:fail]= 'You Must Be Logged In To View That Page'
	  end
	end
	
end
