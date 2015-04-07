# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  stars      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  musing_id  :integer
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
