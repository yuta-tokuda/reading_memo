class AddAbstractionForMemos < ActiveRecord::Migration[5.0]
  def change
    add_column :memos, :abstraction, :string, comment: '抽象化'
  end
end
