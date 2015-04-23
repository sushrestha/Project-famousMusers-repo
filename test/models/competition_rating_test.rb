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

require 'test_helper'

class CompetitionRatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
