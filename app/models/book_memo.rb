class BookMemo < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :book
end
