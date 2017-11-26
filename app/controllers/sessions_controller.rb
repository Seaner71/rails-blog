class SessionsController < ApplicationController
  def new
    # redirect_to '/', notice: "You are already logged in" if logged_in?
    @current_user = User.find_by_id(session[:user_id])
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Successfully logged in!"
    else
      redirect_to '/signin', notice: "Unkown username and/or password"
    end
  end
  def logout
    session.clear
    redirect_to '/signin', notice: "Successfully logged out!"
  end
end
