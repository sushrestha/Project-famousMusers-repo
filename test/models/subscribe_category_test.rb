# == Schema Information
#
# Table name: subscribe_categories
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  muser_id    :integer
#  category_id :integer
#

require 'test_helper'

class SubscribeCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
