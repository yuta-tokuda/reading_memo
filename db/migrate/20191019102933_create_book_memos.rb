class CreateBookMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :book_memos do |t|
      t.references :book, null: false, comment: '本'
      t.string :title,    null: false, comment: 'タイトル'
      t.string :content,  null: false, comment: '内容'

      t.timestamps
    end
  end
end
