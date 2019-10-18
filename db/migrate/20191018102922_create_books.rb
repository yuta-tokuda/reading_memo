class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false, comment: 'タイトル'
      t.string :author, null: false, comment: '作者'

      t.timestamps
    end
  end
end
