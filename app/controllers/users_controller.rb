class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    #@books = @user.books
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
    
  end
  
  def edit
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :image, :email)
  end  
end
