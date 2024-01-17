class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
 
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end
  
  def new
    @user = User.new(user_params)
        if @user.save
         flash[:notice] = "You have created user successfully."
         redirect_to  user_path(current_user.id)
        else
         flash[:notice]= 'errors unable to register new user.'
         render "users/sign_up"
        end
  end  
  
  
  
  def index
    @users =User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update  
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = " errors prohibited this obj from being saved:"
          render :edit
  end
 end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
