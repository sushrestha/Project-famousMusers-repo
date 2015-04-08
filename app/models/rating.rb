# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  stars      :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  musing_id  :integer
#

class Rating < ActiveRecord::Base

	# stars belong to musing
	belongs_to :musing,
				class_name: 'Musing',
				foreign_key: 'musing_id'

	validates :stars, presence: true, inclusion:{in: 0..5}
	validates :musing_id, presence: true
end
