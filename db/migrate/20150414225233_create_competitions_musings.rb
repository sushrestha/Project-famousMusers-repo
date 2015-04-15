class CreateCompetitionsMusings < ActiveRecord::Migration
  def change
    create_table :competitions_musings do |t|
      t.references :competition, index: true

      t.references :musing, index: true
      t.timestamps null: false
    end
  end
end
