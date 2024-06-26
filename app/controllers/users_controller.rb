class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
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
    @user = current_user
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "successfully."
      redirect_to user_path(user.id)
    else
      @user = user
      render :edit
    end
  end

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction )
  end
  def correct_user
  @user = User.find(params[:id])
  redirect_to user_path(current_user.id) unless @user == current_user
  end
end


