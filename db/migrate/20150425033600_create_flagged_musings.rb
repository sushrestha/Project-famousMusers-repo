class CreateFlaggedMusings < ActiveRecord::Migration
  def change
    create_table :flagged_musings do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
