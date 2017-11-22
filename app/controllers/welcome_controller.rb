class WelcomeController < ApplicationController
  def index
    @user = User.new
  end
  def create
      @user = User.find_or_create_by(user_params)
      # session[:user_id] = user.id
      if @user.save
        redirect_to user_path
      else
        redirect_to welcome_index_path
    end
  end
  private
  def user_params
    params.require(:user).permit(:username)
  end
end
