# == Schema Information
#
# Table name: flagged_musings
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  musing_id   :integer
#  muser_id    :integer
#

require 'test_helper'

class FlaggedMusingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
