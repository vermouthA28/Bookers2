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
   is_matching_login_user
    @user = current_user
  end


    def create
        @user = current_user
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        flash[:notice]= "You have created book successfully."
      if @book.save
          redirect_to book_path(@book)
      else
          render :index
      end
    end

    def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to  books_path
    end

  def update
       is_matching_login_user
      @book.update(book_params)
      flash[:notice]= "You have updated book successfully."

    if @book.save
      redirect_to book_path(@book.id)
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
      redirect_to book_path(@book)
    end
  end





end
