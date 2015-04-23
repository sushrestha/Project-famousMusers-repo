# == Schema Information
#
# Table name: competition_ratings
#
#  id               :integer          not null, primary key
#  competitionstars :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  competition_id   :integer
#  musing_id        :integer
#

class CompetitionRating < ActiveRecord::Base
  belongs_to :musing,
        class_name: 'Musing',
        foreign_key: 'musing_id'
  belongs_to :competition, foreign_key: 'competition_id'

  validates :competitionstars, presence: true, inclusion:{in: 0..5}
  validates :musing_id, presence: true
  validates :competition_id, presence: true
end
