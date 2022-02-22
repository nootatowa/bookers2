class BooksController < ApplicationController
  def new
  end

  def index
   @user = current_user
   @book = Book.new
   @books = Book.all
  end

  def show
      @user = current_user
      @book = Book.find(params[:id])
      @books = Book.all

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  def edit
     @book = Book.find(params[:id])
  end
    def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end
    private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body,:image)
  end
end
