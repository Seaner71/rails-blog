class UsersController < ApplicationController
  before_action :get_user, only: [:show, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  def create
    @user = Author.new(user_params)
    if @user.save
      redirect_to user_path(@user)
      # remember, author_path is the prefix accessible from running rake routes.
      # The \@\author parameter pulls the current author info from the get_author private method below
    else
      redirect_to new_userr_path
      # remember, new_author_path is the prefix accessible from running rake routes
    end
  end
  def show
  end
  private

    def user_params
      params.require(:user).permit(:username)
    end

    def get_user
      @user = User.find_by_id(params[:id])
    end

end
