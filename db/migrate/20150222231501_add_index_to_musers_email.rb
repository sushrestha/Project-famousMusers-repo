class AddIndexToMusersEmail < ActiveRecord::Migration

  def change
    add_index :musers, :email, unique: true
  end

end
