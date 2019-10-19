class BookMemosController < ApplicationController
  def index
    @book_memos = BookMemo.includes(:book).all
  end

  def show
    @book_memo = BookMemo.find(params[:id])
  end

  def new
    @book_memo = BookMemo.new
    @books_select = Book.all.collect { |b| [b.title, b.id] }
  end

  def create
    @book_memo = BookMemo.new(permit_params)
    @book_memo.save!
    flash[:notice] = 'メモを登録しました。'
    redirect_to action: :show, id: @book_memo.id
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def update
    @book_memo = BookMemo.find(params[:id])
    @book_memo.update!(permit_params)
    flash[:notice] = 'メモを更新しました。'
    redirect_to action: :show, id: @book_memo.id
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  def edit
    @book_memo = BookMemo.find(params[:id])
    @books_select = Book.all.collect { |b| [b.title, b.id] }
  end

  def destroy
    @book_memo = BookMemo.find(params[:id])
    @book_memo.destroy
    flash[:notice] = 'メモを削除しました。'
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  private

  def permit_params
    params.require(:book_memo).permit(:book_id, :title, :content)
  end
end
