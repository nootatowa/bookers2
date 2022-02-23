class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
      @user = User.find(params[:id])
  if  @user!= current_user
       redirect_to user_path(current_user)
  end
  end

  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to user_path(@user.id),flash: { notice: 'User was successfully updated.' }
  else
      render :edit
  end
  end
    def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
    end

end

