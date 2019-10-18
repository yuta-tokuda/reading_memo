class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(permit_params)
    @book.save!
    flash[:notice] = '本情報を登録しました。'
    redirect_to action: :show, id: @book.id
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def update
    @book = Book.find(params[:id])
    @book.update!(permit_params)
    flash[:notice] = '本情報を更新しました。'
    redirect_to action: :show, id: @book.id
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = '本情報を削除しました。'
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  private

  def permit_params
    params.require(:book).permit(:title, :author)
  end
end
