class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
  end
end
