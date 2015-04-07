class AddMusingRefToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :musing, index: true
    add_foreign_key :ratings, :musings
  end
end
