class BooksController < ApplicationController
  def new
    @books = Book.new
  end
  
   def create
    @user = current_user
    @book = Book.new(books_params)
    @book.user_id = (current_user.id)
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    
    else
    @books = Book.all.order(id: :asc)
    
    render :index
   end
   end

  def index
    @user = current_user
    @books = Book.page(params[:page])
    @book = Book.new
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end
  
  def edit
    @books = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(books_params)
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(book.id)  
    
    else
    @books = Book.all
    flash[:notice]= 'errors prohibited this obj from being saved.'
    render "edit"
    end
    
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
