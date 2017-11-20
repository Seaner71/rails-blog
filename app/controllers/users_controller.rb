class UsersController < ApplicationController
  before_action :get_user, only: [:show, :destroy]
  def index
    @user = User.all
  end

  def new
    @user = User.new
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
