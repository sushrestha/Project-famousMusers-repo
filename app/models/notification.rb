class Notification < ActiveRecord::Base
  belongs_to :recipient, foreign_key: 'muser_id'
   
  validates :linktype, presence: true
  #for messages this will be the id of the message sender
  validates :linkid, presence: true
  validates :unread, presence: true, :inclusion => { :in => [true, false] }
end
