class BooksController < ApplicationController

    def new
      @newbook = Book.new
      @book = Book.find(params[:id])
      @user = @book.user
    end

    def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have created book successfully"
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index #Books contolollerから始める
    end

    end

    def index
      @user = curent_user
      @book = Book.new
      @books = Book.all
    end

    def show
      @newbook = Book.new
      @book = Book.find(params[:id])
      @user = @book.user
    end
    
    def edit
      @book = Book.find(params[:id])
      if @book.user == curent_user
        render "edit"
      else
        redirect_to books_path
      end
    end
    
    def update
      @book = Book.find(params[:id])
      @book.user_id = curent_user.id
      if @book.update(book_params)
        flash[:notice]="Book was successfully update"
        redirect_to book_path(@book.id)
      else
        render :edit
      end
    end
        

    def destroy
      @book = Book.find(params[:id])
      if @book.destroy
        flash[:notice] = "Book was successfully destroy"
        redirect_to books_path
      end
    end

    # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end

end