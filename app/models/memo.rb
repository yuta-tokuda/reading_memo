class Memo < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :type, presence: true

  belongs_to :book, required: false

  delegate :title, to: :book, prefix: true, allow_nil: true

  enum type: { book: 0, net: 1, real: 2 }

  before_save :check_type

  # typeというカラム名を使うための設定
  # 元々typeというメソッドがあるため設定が必要
  self.inheritance_column = :_type_disabled

  def check_type
    self.book_id = nil unless type == 'book'
  end
end
