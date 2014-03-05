class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		#caching in instance variable since this could be called many times during a request. 
	end
	
	#this turns whatever method into a helper method that is then accessible from a view
	
	helper_method :current_user
end