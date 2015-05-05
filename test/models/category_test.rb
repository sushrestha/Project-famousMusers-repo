# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@category = categories(:Lyrics)
  end

  test "must be valid" do
  	assert @category.valid?
  end

  test "category name must be present" do
  	@category.name = ""
  	assert_not @category.valid?
  end

   test "blank mmust be allowed on descirption" do
  	@category.desc = ""
  	assert @category.valid?
  end

   test "descirption must be less than 250" do
  	@category.desc = "this is test"*25
  	assert_not @category.valid?
  end

end
