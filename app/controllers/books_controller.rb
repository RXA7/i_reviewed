class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  def index
    #TO SHOW ALL BOOKS TO ANY USER: @books = Book.all
    # was used too show al books for current user @books = current_user.books.all
    #This is new to show paginated book index:
    @books = current_user.books.paginate(page: params[:page], per_page: 10)
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    #TO SHOW ALL BOOKS TO ANY USER: @book = Book.new
    @book = current_user.books.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
  #TO SHOW ALL BOOKS TO ANY USER: @book = Book.new(book_params)
    @book = current_user.books.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      #TO SHOW ALL BOOKS TO ANY USER: @book = Book.find(params[:id])
      @book = current_user.books.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :author)
    end
end
