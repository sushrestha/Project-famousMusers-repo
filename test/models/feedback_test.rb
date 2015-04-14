# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  response   :text
#  musing_id  :integer
#  muser_id   :integer
#  time       :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
