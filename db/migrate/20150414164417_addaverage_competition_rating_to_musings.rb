class AddaverageCompetitionRatingToMusings < ActiveRecord::Migration
  def change
    add_column :musings, :averageCompetitionRating, :float, :default => 0.0, :null => false
  end
end
