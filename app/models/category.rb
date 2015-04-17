class Category < ActiveRecord::Base

	has_many :musings, :class_name => 'musing', :foreign_key => 'category_id'
	validates :name, presence: true
end
