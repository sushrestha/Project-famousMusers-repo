
# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Category < ActiveRecord::Base

	has_many :musings, :class_name => 'musing', :foreign_key => 'category_id'
	validates :name, presence: true

end
