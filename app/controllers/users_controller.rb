class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.find(params[:id])
    @book = Book.new
    @books =Book.all
  end

  def show
    @user = current_user
    @book = Book.new
    @books =Book.all
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
