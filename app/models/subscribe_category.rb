class SubscribeCategory < ActiveRecord::Base

	validates :muser_id, presence: true
	validates :name, presence: true

end
