class UsersController < ApplicationController
  before_action :get_user, only: [:show, :destroy, :edit]
  def index
    @users = User.all
    @current_user = User.find_by_id(session[:user_id])
  end

  def new
    # redirect_to '/', notice: "You are already logged in" if logged_in?
    @user = User.new
    @current_user = User.find_by_id(session[:user_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
        # session
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Successfully signed up"
      # remember, user_path is the prefix accessible from running rake routes.
      # The \@\user parameter pulls the current user info from the get_user private method below
    else
      redirect_to '/signup', notice: "An error prevented sign up: \n#{@user.errors.full_messages.join('/n')}"

    end
  end
  def edit
    @user = User.find_by_id(params[:id])
    @current_user = User.find_by_id(session[:user_id])
  end
  def show
    @user = User.find_by_id(params[:id])
    @current_user = User.find_by_id(session[:user_id])

  end
  def destroy
    @user.destroy
    redirect_to users_path
  end
  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def get_user
      @user = User.find_by_id(params[:id])
    end

end
