# == Schema Information
#
# Table name: pictures
#
#  id           :integer          not null, primary key
#  comment      :string
#  name         :string
#  content_type :string
#  data         :binary
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  musing       :string
#  references   :string
#

require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
