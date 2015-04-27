class AddMusingRefToFlaggedMusing < ActiveRecord::Migration
  def change
    add_reference :flagged_musings, :musing, index: true
    add_foreign_key :flagged_musings, :musings
  end
end
