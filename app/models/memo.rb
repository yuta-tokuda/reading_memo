class Memo < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :book, required: false

  delegate :title, to: :book, prefix: true, allow_nil: true
end
