class AddMusingRefToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :musing, :string
    add_column :pictures, :references, :string
  end
end
