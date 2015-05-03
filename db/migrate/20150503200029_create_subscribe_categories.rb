class CreateSubscribeCategories < ActiveRecord::Migration
  def change
    create_table :subscribe_categories do |t|

      t.timestamps null: false
    end
  end
end
