class RemoveAbstraction < ActiveRecord::Migration[5.0]
  def change
    remove_column :memos, :abstraction, :string, comment: '抽象化'
  end
end
