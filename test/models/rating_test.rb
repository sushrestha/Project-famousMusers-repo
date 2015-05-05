# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  stars      :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  musing_id  :integer
#  muser_id   :integer
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

def setup
	 @muser = musers(:homer)
	# @musing = musings(:poem)
	# @rating = @muser.rate.new(stars: 5, musing_id: @musing.id)
	@rating = ratings(:first)
end

#for valid input for all fields at once
test "must be valid" do
	assert @rating.valid?
end

#1 to 5 stars are allowed
test "1 to 5 are stars allowed" do
	@rating.stars = 2
	assert @rating.valid?
end

#muser must be present
test "user must be needed to rate" do
    @rating.muser_id = nil
    assert_not @rating.valid?
end

#musing must be present
test "musing must be needed to get rated" do
    @rating.musing_id = nil
    assert_not @rating.valid?
end
#only 1 to 5 stars allowed
test "Only 1 to 5 stars allowed" do
	@rating.stars = 0
	assert_not @rating.valid?
end

end