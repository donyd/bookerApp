class BookshelvesController < ApplicationController
  def index
    # GET reader with id=1
    # /movies/1/reviews
    @reader = Reader.find(params[:reader_id])
    @bookshelves = @reader.bookshelves
  end

  def show
    # Find bookshelf with id = 2 for reader = 1
    # /reader/1/bookshelf/2
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.find(params[:id])
  end

  def new
    # Associate a boohshelf with a reader = 1
    # /reader/1/bookshelf/new
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.build
  end

  def addBook()
    self.count += 1
  end

  def create
    # Associate a bookshelf with a id = 1
    # /reader/1/bookshelf
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.build(params.require(:bookshelf).permit(:shelf_name))

    if @bookshelf.save
      redirect_to reader_bookshelf_url(@reader, @bookshelf)
    else
      render :action => "new"
    end
  end

  def edit
    # Edit bookshelf = id for reader = id
    # /reader/1/bookshelf/2/edit
    @reader = Reader.find(params[:reader_id])
    @bookshelf = @reader.bookshelves.find(params[:id])
  end

  def update
    @reader = Reader.find(params[:reader_id])
    @bookshelf = Bookshelf.find(params[:id])

    if @bookshelf.update_attributes(params.require(:bookshelf).permit(:shelf_name))
      redirect_to reader_bookshelf_url(@reader, @bookshelf)
    else
      render :action => "edit"
    end
  end

  def destroy
    @reader = Reader.find(params[:reader_id])
    @bookshelf = Bookshelf.find(params[:id])
    @bookshelf.destroy
    respond_to do |format|
      format.html { redirect_to reader_bookshelves_path(@reader) }
      format.xml { head :ok }
    end
  end

end
