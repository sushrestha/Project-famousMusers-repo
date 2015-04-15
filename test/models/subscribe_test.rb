# == Schema Information
#
# Table name: subscribes
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SubscribeTest < ActiveSupport::TestCase
  def setup
    @subscribe = Subscribe.new(follower_id: 1, followed_id: 2)
  end

  test "should be valid" do
    assert @subscribe.valid?
  end

  test "should require a follower_id" do
    @subscribe.follower_id = nil
    assert_not @subscribe.valid?
  end

  test "should require a followed_id" do
    @subscribe.followed_id = nil
    assert_not @subscribe.valid?
  end
end
