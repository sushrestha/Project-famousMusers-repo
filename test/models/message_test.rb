# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :integer
#  recipient_id :integer
#  authorname   :string
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
