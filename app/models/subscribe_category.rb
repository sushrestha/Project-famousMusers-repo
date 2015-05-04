# == Schema Information
#
# Table name: subscribe_categories
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  muser_id    :integer
#  category_id :integer
#

class SubscribeCategory < ActiveRecord::Base
	belongs_to :muser, :class_name => "Muser", :foreign_key => 'muser_id'
	belongs_to :category, :class_name => "Category", :foreign_key => 'category_id'

end
