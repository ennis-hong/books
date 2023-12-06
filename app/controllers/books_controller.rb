class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @books = Book.order(id: :desc)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(set_book)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @book.comments
  end

  def edit
  end

  def update
    if @book.update(set_book)
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def set_book
    params.require(:book).permit(:title, :description, :price)
  end
end
