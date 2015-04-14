class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :response
      t.integer :musing_id
      t.integer :muser_id
      t.time :time

      t.timestamps null: false
    end
  end
end
