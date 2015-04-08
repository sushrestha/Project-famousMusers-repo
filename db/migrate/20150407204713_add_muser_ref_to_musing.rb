class AddMuserRefToMusing < ActiveRecord::Migration
  def change
    add_reference :musings, :muser, index: true
    add_foreign_key :musings, :musers
  end
end
