class AddMusingRefToCompetitionRating < ActiveRecord::Migration
  def change
    add_reference :competition_ratings, :musing, index: true
    add_foreign_key :competition_ratings, :musings
  end
end
