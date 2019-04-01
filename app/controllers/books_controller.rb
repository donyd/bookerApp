class BooksController < ApplicationController
  def index
    # /reader/1/bookshelves/1/books
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.find(params[:bookshelf_id])
    @books = @bookshelf.books

  end

  def show
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.find(params[:bookshelf_id])
    @book = @bookshelf.books.find(params[:id])
  end

  def new
    # Associate a book with a bookshelf = id
    # /bookshelf/1/book/new
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.find(params[:bookshelf_id])
    @book = @bookshelf.books.build
  end

  def create
    # Associate a book with a bookshelf = id
    # /bookshelf/1/book
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.find(params[:bookshelf_id])
    @book = @bookshelf.books.build(params.require(:book).permit(:title, :author_firstname, :author_lastname, :year, :genre))

    if @book.save
      redirect_to reader_bookshelf_book_url(@reader, @bookshelf, @book)
    else
      render :action => "new"
    end
  end

  def edit
    # Edit book = id
    # /reader/1/bookshelf/2/books/1/edit
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.find(params[:bookshelf_id])
    @book = @bookshelf.books.find(params[:id])
  end

  def update
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.find(params[:bookshelf_id])
    @book = @bookshelf.books.find(params[:id])

    if @book.update_attributes(params.require(:book).permit(:title, :author_firstname, :author_lastname, :year, :genre))
      redirect_to reader_bookshelf_book_url(@reader, @bookshelf, @book)
    else
      render :action => "edit"
    end
  end

  def destroy
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.find(params[:bookshelf_id])
    @book = @bookshelf.books.find(params[:id])

    @book.destroy
    respond_to do |format|
      format.html { redirect_to reader_bookshelves_path(@reader) }
      format.xml { head :ok }
    end
  end


end
