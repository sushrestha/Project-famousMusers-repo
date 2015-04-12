class AddMuserRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :muser, index: true
    add_foreign_key :ratings, :musers
  end
end
