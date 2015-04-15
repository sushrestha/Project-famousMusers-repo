class AddCompetitionRefToCompetitionRating < ActiveRecord::Migration
  def change
    add_reference :competition_ratings, :competition, index: true
    add_foreign_key :competition_ratings, :competitions
  end
end
