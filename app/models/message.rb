class Message < ActiveRecord::Base
  belongs_to :author, :class_name => "Muser", :foreign_key => "author_id"
  belongs_to :recipient, :class_name => "Muser", :foreign_key => "recipient_id"
  
  validates :content, presence: true
  validates :author, presence: true
  validates :recipient, presence: true
end
