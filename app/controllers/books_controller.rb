class BooksController < ApplicationController
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
    @book = Book.find(params[:id])
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice]= "You have created book successfully."
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to  books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice]= "You have updated book successfully."
    redirect_to book_path(book.id)
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:body, :title)
  end


end
