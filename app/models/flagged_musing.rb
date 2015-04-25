# == Schema Information
#
# Table name: flagged_musings
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  musing_id   :integer
#  muser_id    :integer
#

class FlaggedMusing < ActiveRecord::Base

	belongs_to :musing, :class_name => "Musing", :foreign_key => 'musing_id'
	belongs_to :muser,  :class_name => "Muser", :foreign_key => 'muser_id'

	validates :description, presence: true, length: { maximum: 255 } 
	validates :musing_id, presence: true
	validates :muser_id, presence: true
end
