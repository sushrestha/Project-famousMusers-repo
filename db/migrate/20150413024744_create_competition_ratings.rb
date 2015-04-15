class CreateCompetitionRatings < ActiveRecord::Migration
  def change
    create_table :competition_ratings do |t|
      t.integer :competitionstars

      t.timestamps null: false
    end
  end
end
