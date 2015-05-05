# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  stars      :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  musing_id  :integer
#  muser_id   :integer
#

class Rating < ActiveRecord::Base

	belongs_to :musing, :class_name => "Musing", :foreign_key => 'musing_id'
	belongs_to :muser,  :class_name => "Muser", :foreign_key => 'muser_id'
	validates :stars, presence: true, inclusion:{in: 1..5}
	validates :musing_id, presence: true
	validates :muser_id, presence: true
end
