class MemosController < ApplicationController
  def index
    params[:search_memo_type] = 'all' unless params[:search_memo_type]
    @memos = search_result
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(permit_params)
    @memo.save!
    flash[:notice] = 'メモを登録しました。'
    redirect_to action: :show, id: @memo.id
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def update
    @memo = Memo.find(params[:id])
    @memo.update!(permit_params)
    flash[:notice] = 'メモを更新しました。'
    redirect_to action: :show, id: @memo.id
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  def edit
    @memo = Memo.find(params[:id])
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
    params.require(:memo).permit(:book_id, :title, :content, :type, :abstraction)
  end

  def search_result
    memos = params[:search_memo_type] == 'all' ? Memo.all : Memo.where(type: params[:search_memo_type])
    @q = memos.ransack(params[:q])
    @q.result.includes(:book).order(created_at: :DESC)
  end
end
