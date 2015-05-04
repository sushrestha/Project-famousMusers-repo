class AddMuserRefToCompetitionRating < ActiveRecord::Migration
  def change
    add_reference :competition_ratings, :muser, index: true
    add_foreign_key :competition_ratings, :musers
  end
end
