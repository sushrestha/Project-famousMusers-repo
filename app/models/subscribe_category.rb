class SubscribeCategory < ActiveRecord::Base
	belongs_to :muser, :class_name => "Muser", :foreign_key => 'muser_id'
	belongs_to :category, :class_name => "Category", :foreign_key => 'category_id'

	validates :category_id, presence: true
	validates :muser_id, presence: true
end
