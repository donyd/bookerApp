class BooksController < ApplicationController
  def index
    # /reader/1/bookshelves/1/books
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.find(params[:bookshelf_id])
    @books = @bookshelf.books

  end

  def show
  end

  def new
  end

  def edit
  end
end
