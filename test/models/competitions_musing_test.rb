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

require 'test_helper'

class CompetitionsMusingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
