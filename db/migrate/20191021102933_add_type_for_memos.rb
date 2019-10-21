class AddTypeForMemos < ActiveRecord::Migration[5.0]
  def change
    add_column :memos, :type, :integer, null: false, comment: '種類'
  end
end
