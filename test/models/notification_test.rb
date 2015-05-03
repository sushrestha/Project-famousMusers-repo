# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  linktype   :string
#  linkid     :integer
#  unread     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  muser_id   :integer
#

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
