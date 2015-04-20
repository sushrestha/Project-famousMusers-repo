class AddCategoryRefToMusings < ActiveRecord::Migration
  def change
    add_reference :musings, :category, index: true
    add_foreign_key :musings, :categories
  end
end
