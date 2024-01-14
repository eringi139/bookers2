class BooksController < ApplicationController
  def new
    @books = Book.new
  end
  
   def create
    @user = current_user
    @books = Book.new(books_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to books_path(@books.id)
   end

  def index
    @user = current_user
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @user = current_user
    @books = Book.find(params[:id])
    @book_new = Book.new
  end
  
  def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to "/books"
     end
  
  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
  end
end
