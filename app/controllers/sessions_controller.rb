class SessionsController < ApplicationController
  def new
  end
  
  def create
  	
  	#First try logging in by Facebook
  	fbuser = User.from_omniauth(env["omniauth.auth"])
  	if fbuser
  		session[:user_id] = fbuser.id
  	else
  	  #Otherwise try logging in the nromal way
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
      	session[:user_id] = user.id
      end
    end
    
    # If we end up with a valid session, redirect. Otherwise show an error. 
    if session[:user_id]
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password invalid"
      render "new"
    end
  end
  
  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "Goodbye!"
  end
end