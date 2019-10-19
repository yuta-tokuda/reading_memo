class Memo < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :book, required: false

  delegate :title, to: :book, prefix: true, allow_nil: true

  def self.search_memo_type(memo_type)
    case memo_type
    when 'book'
      Memo.where.not(book_id: nil)
    when 'normal'
      Memo.where(book_id: nil)
    else
      Memo.all
    end
  end
end
