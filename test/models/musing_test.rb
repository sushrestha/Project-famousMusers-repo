# == Schema Information
#
# Table name: musings
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  isPrivate  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  muser_id   :integer
#

require 'test_helper'

class MusingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end



  def setup
    @muser  = musers(:homer)
    @musing = @muser.musings.build(title: "Cookie", content: "This is that. That is this.", isPrivate: 1)
  	#@musing = Musing.new(title: "Cookie", content: "This is that. That is this.", isPrivate: 1)
  end

    # for valid input for all fields at once
  test "must be valid" do
  	assert @musing.valid?
  end

        # for user id required field "Why its not working .... must check"
  # test "user id must be present" do
  #   @musing.muser_id = nil
  #   assert_not @musing.valid?
  # end

      # for title required field
  test "title must be required" do
  	@musing.title = ""
  	assert_not @musing.valid?
  end

        # for content required field
  test "content must be required" do
  	@musing.content = ""
  	assert_not @musing.valid?
  end

          # for isPrivate option required field
  test "Private/public option must be required" do
    @musing.isPrivate = ""
    assert_not @musing.valid?
  end
        # for title with maximum length
  test "length of title must be 50" do
  	@musing.title = "123456789 "*6
  	assert_not @musing.valid?
  end
        # for content with maximum length
  test "length of content must be 250" do
  	@musing.content = "123456789 "*26
  	assert_not @musing.valid?
  end

  # more refinement
  #order must be most recent first
  test "order must be most recent first" do
    assert_equal Musing.first, musings(:most_recent)
  end



end
