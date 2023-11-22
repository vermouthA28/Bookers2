class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end
  
  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end
  
  
end
