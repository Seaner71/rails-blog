class WelcomeController < ApplicationController
  def index
  end
  def create
      @user = User.find_or_create_by(username: username)
      # session[:user_id] = user.id
      if @user.save
        redirect_to user
      else
        redirect_to welcome_index
    end
  end
end
