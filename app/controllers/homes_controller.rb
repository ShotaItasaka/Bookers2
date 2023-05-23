class HomesController < ApplicationController
  def top
    
  end

  def about
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    book.destroy
    redirect_to '/about'
  end

  def index
    @book = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
