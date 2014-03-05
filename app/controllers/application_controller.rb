class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  force_ssl

# private method(s)
private

  # Current user method, used to check if user is logged in.
  def current_user
    
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # Note that we cache the instance variable in @current_user since this could be called many times during a request. 
  end
  
  # This turns the passed method name into a helper method that is then accessible from a view, where controller methods would not otherwise be accessible.
  helper_method :current_user
  
  # We can use teh authorize method to automatically redirect to the login page if we use it in some controllers. Note we haven't implemented this yet. 
  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end