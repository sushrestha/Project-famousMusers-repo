# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  linktype   :string
#  linkid     :integer
#  unread     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  muser_id   :integer
#

class Notification < ActiveRecord::Base
  belongs_to :recipient, foreign_key: 'muser_id'
   
  validates :linktype, presence: true
  #for messages this will be the id of the message sender
  validates :linkid, presence: true
  validates :unread, presence: true, :inclusion => { :in => [true, false] }
end
