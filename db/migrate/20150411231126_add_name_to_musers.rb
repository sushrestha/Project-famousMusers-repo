class AddNameToMusers < ActiveRecord::Migration
  def change
    add_column :musers, :name, :string
  end
end
