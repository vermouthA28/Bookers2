class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit

    @user = current_user
  end


    def create
        @user = current_user
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if@book.save
        flash[:notice]= "You have created book successfully."
          redirect_to book_path(@book)
      else
          @books = Book.all
          @user = current_user
          render :index
      end
    end

    def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to  books_path
    end

  def update

      @book.update(book_params)
      flash[:notice]= "You have updated book successfully."

    if @book.save
      redirect_to book_path
    else
      render :edit
    end
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:body, :title)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end





end
