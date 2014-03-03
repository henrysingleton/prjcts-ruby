class UsersController < ApplicationController
  def new
    @user = User new
  end

  def create
    @user = User.new(params[:user]) #so there is a params array we can access?
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end
