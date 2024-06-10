class UsersController < ApplicationController
  def show
    #@books = @user.books
  end

  def edit
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :image, :email)
  end  
end
