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
      redirect_to '/signup', notice: "An error prevented sign up: #{@user.errors.full_messages.join('---')}"

    end
  end
  def edit
    @user = User.find_by_id(params[:id])
    @current_user = User.find_by_id(session[:user_id])
  end

 # attempt to PUT/PATCH user information via form on users edit view
  def update
    @user = User.find_by_id(params[:id])
    @current_user = User.find_by_id(session[:user_id])
      if @user.update(user_params)
        redirect_to user_path, notice: 'Successfully updated!'
      else
        redirect_to edit_user_path, notice: "An error prevented update: #{@user.errors.full_messages}"
      end
  end

  def show
    @user = User.find_by_id(params[:id])
    @current_user = User.find_by_id(session[:user_id])

  end
  def destroy
    @user.destroy
    redirect_to'/signup'
  end
  private

    def user_params
      params.require(:user).permit(:username, :password, :email)
    end

    def get_user
      @user = User.find_by_id(params[:id])
    end

end
