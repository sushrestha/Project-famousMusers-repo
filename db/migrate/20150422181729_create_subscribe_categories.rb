class CreateSubscribeCategories < ActiveRecord::Migration
  def change
    create_table :subscribe_categories do |t|
      t.integer :category_id
      t.integer :muser_id

      t.timestamps null: false
    end
  end
end
