class AddMusingRefToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :musing, index: true
    add_foreign_key :pictures, :musings
  end
end
