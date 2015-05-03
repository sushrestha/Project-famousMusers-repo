class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :linktype
      t.integer :linkid
      t.boolean :unread

      t.timestamps null: false
    end
  end
end
