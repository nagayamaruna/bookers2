class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @book = Book.new
  end
  
  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end  
    

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @bookshow = Book.find(params[:id])
    @book = Book.new
    @user = @bookshow.user
  end
  
  def edit
    @book = Book.find(params[:id])
    unless current_user
      redirect_to auth_login_path
    end
    unless current_user.id == @book.user_id
      flash[:error] = "あなたはこの投稿を編集できません。"
      redirect_to "/books"
    end
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(book)
    else
      @book = book
      @user = current_user
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end  
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
