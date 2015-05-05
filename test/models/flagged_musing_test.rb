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

  def setup
  	@flagged_musing = flagged_musings(:flagmusing1)
  end

  test "must be valid" do
    assert @flagged_musing.valid?
  end

#muser must be present
test "user must be needed to flag" do
    @flagged_musing.muser_id = nil
    assert_not @flagged_musing.valid?
end

#musing must be present
test "musing must be needed to get flagged" do
    @flagged_musing.musing_id = nil
    assert_not @flagged_musing.valid?
end

#description must be present
test "description must be needed" do
    @flagged_musing.description = nil
    assert_not @flagged_musing.valid?
end

 # for content with maximum length
  test "length of description must be 255" do
  	@flagged_musing.description = "123456789 "*26
  	assert_not @flagged_musing.valid?
  end


end
