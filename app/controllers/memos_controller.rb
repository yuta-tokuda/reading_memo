class MemosController < ApplicationController
  def index
    @memos = Memo.includes(:book).all
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
    @memo = Memo.new
    @books_select = Book.all.collect { |b| [b.title, b.id] }
  end

  def create
    @memo = Memo.new(permit_params)
    @memo.save!
    flash[:notice] = 'メモを登録しました。'
    redirect_to action: :show, id: @memo.id
  rescue ActiveRecord::RecordInvalid
    @books_select = Book.all.collect { |b| [b.title, b.id] }
    render :new
  end

  def update
    @memo = Memo.find(params[:id])
    @memo.update!(permit_params)
    flash[:notice] = 'メモを更新しました。'
    redirect_to action: :show, id: @memo.id
  rescue ActiveRecord::RecordInvalid
    @books_select = Book.all.collect { |b| [b.title, b.id] }
    render :edit
  end

  def edit
    @memo = Memo.find(params[:id])
    @books_select = Book.all.collect { |b| [b.title, b.id] }
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    flash[:notice] = 'メモを削除しました。'
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  private

  def permit_params
    params.require(:memo).permit(:book_id, :title, :content)
  end
end
