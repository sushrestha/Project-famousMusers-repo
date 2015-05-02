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

class Message < ActiveRecord::Base
  belongs_to :author, :class_name => "Muser", :foreign_key => "author_id"
  belongs_to :recipient, :class_name => "Muser", :foreign_key => "recipient_id"
  
  validates :content, presence: true
  validates :author, presence: true
  validates :recipient, presence: true
  validates :authorname, presence: true
end
