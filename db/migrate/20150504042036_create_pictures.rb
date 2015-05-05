class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :comment
      t.string :name
      t.string :content_type
       
       # If using MySQL, blobs default to 64k, so we have to give
       # an explicit size to extend them
      t.binary :data, :limit => 1.megabyte
      
      t.timestamps null: false
    end
  end
end
