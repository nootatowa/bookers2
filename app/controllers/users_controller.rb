class UsersController < ApplicationController

  def index
    # @users = User.page(params[:page])
    # @user = User.find(params[:id])
    @user = current_user
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end
    def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
    end
end
