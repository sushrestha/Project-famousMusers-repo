class AddMuserRefToFlaggedMusing < ActiveRecord::Migration
  def change
    add_reference :flagged_musings, :muser, index: true
    add_foreign_key :flagged_musings, :musers
  end
end
