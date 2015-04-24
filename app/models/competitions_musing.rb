# == Schema Information
#
# Table name: competitions_musings
#
#  id             :integer          not null, primary key
#  competition_id :integer
#  musing_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class CompetitionsMusing < ActiveRecord::Base
  belongs_to :competition
  belongs_to :musing
end
