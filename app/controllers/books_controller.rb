class BooksController < ApplicationController
    def new
      @book = Book.new
    end

    def create
    @book = PostImage.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
    end

    def index
      @book = Book.all
    end

    def show
      @book = Book.find(params[id])
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
    redirect_to post_images_path
    end

    # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end

end