class CompetitionsMusing < ActiveRecord::Base
  belongs_to :competition
  belongs_to :musing
end
