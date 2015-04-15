class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :subscribes, :follower_id
    add_index :subscribes, :followed_id
    add_index :subscribes, [:follower_id, :followed_id], unique: true
  end
end
