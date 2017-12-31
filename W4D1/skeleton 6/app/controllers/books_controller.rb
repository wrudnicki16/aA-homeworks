class BooksController < ApplicationController
  def index
    @books = Book.all
    render index: Book.all
  end

  def new
    render index: Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    else
      render index: book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
