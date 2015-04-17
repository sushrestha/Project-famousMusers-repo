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
#  muser_id   :integer
#

class Musing < ActiveRecord::Base


	belongs_to :category, :class_name => 'category', :foreign_key => 'category_id'
	

	belongs_to :muser # 1 musing belongs to 1 muser
	default_scope -> { order(created_at: :desc) } #listing the musings in most recently created.
	# 1 musing has 0..* stars
	has_many :stars, :class_name => "Rating", :foreign_key => 'musing_id', dependent: :destroy

	has_many :competitionstars,
        class_name: 'CompetitionRating',
        foreign_key: 'musing_id'
  has_and_belongs_to_many :competitions #, join_table: :competitions_musings
  
	validates :title, presence: true, length: { maximum: 50 }
	validates :content, presence: true, length: { maximum: 250 }
	validates :isPrivate, presence: true
	validates :muser_id, presence: true
	validates :category_id, presence: true
	#validates :averageCompetitionRating, presence: true
end
