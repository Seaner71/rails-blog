class SessionsController < ApplicationController
  def new
    # redirect_to '/', notice: "You are already logged in" if logged_in?
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/', notice: "Successfully loggen in!"
    else
      redirect_to '/signin', notice: "Unkown username and/or password"
    end
  end
  def logout
    session.clear
    redirect_to '/signin', notice: "Successfully logged out!"
  end
end
