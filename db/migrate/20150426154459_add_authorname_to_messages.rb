class AddAuthornameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :authorname, :string
  end
end
