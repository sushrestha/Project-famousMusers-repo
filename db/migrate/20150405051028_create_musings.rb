class CreateMusings < ActiveRecord::Migration
  def change
    create_table :musings do |t|
      t.string :title
      t.text :content
      t.integer :isPrivate

      t.timestamps null: false
    end
  end
end
