class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
  

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
    
  end
  
  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to 
    end
  
    @user = current_user
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
    
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to 
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :image, :email)
  end  
end
