module MemoHelper
  def books_select
    Book.all.collect { |b| [b.title, b.id] }
  end

  def memo_types_select
    Memo.types_i18n.invert
  end
end
