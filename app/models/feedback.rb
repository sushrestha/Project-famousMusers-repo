# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  response   :text
#  musing_id  :integer
#  muser_id   :integer
#  time       :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feedback < ActiveRecord::Base
end
