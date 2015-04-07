# == Schema Information
#
# Table name: musings
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  isPrivate  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Musing < ActiveRecord::Base

	# 1 musing has 0..* stars
	has_many :stars,
				class_name: 'Rating',
				foreign_key: 'musing_id'
	validates :title, presence: true, length: { maximum: 50 }
	validates :content, presence: true, length: { maximum: 250 }
	validates :isPrivate, presence: true
	
end
