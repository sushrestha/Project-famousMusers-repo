class SubscribeCategory < ActiveRecord::Base
	belongs_to :muser, :class_name => "Muser", :foreign_key => 'muser_id'
	belongs_to :category, :class_name => "Category", :foreign_key => 'category_id'

end
