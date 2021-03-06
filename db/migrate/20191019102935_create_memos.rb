class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.references :book,              comment: '本id'
      t.string :title,    null: false, comment: 'タイトル'
      t.string :content,  null: false, comment: '内容'

      t.timestamps
    end
  end
end
