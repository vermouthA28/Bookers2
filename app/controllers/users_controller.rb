class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books =Book.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books

  end

  def edit
    is_matching_login_user

   end



  def update
    @user = current_user
    @user.update(user_params)
    flash[:notice]= "You have updated user successfully."
    redirect_to user_path(@user)

  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
