# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base

    has_many :categorysubsrciptions, :class_name => "SubscribeCategory", :foreign_key => 'category_id'
	has_many :musings, :class_name => 'musing', :foreign_key => 'category_id'

	validates :name, presence: true
	validates :desc, allow_blank: true,  length: { maximum: 250 }

end
