class Competition < ActiveRecord::Base
  has_and_belongs_to_many :musings #, join_table: :competitions_musings
  has_many :competitionratings, foreign_key: 'competition_id'
  
  validates :name, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates_datetime :end, :after => :start
end
