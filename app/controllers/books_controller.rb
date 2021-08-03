class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new(params[:id])
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book =Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path
  end

  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def books_params
    params.permit(:title, :body)
  end
end
