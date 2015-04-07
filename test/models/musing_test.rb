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
#

require 'test_helper'

class MusingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end



  def setup
  	@musing = Musing.new(title: "Cookie", content: "This is that. That is this.", isPrivate: 1)
  end

    # for valid input for all fields at once
  test "must be valid" do
  	assert @musing.valid?
  end

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

end
