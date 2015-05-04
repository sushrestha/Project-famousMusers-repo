class AddCategoryRefToSubscribeCategory < ActiveRecord::Migration
  def change
    add_reference :subscribe_categories, :category, index: true
    add_foreign_key :subscribe_categories, :categories
  end
end
