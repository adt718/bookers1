class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @books=Book.all
      flash[:alert] = 'error'
      render action: :index
    end
  end


  def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to  books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @books = Book.all
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      flash[:alert] = 'error'
      render :edit, notice: 'update was failed'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
