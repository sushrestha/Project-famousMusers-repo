class CreateMusers < ActiveRecord::Migration
  def change
    create_table :musers do |t|
      t.string :email
      t.timestamps null: false
    end
  end
end
