module MusingsHelper


def average_ratings(musing)
	@sum = sum_ratings(musing)
    @total = musing.stars.size
    return (@sum == 0.0) ? 0 : (@sum/@total).round(1)
end




def sum_ratings(musing)
    @sum = 0
    musing.stars.each do |star|
      @sum = @sum + star.stars.to_i
    end
    return @sum
end


 def musing_flaggedby_currentmuser(muser,musing)
    @flag = FlaggedMusing.where("muser_id = ? and musing_id = ?", muser.id, musing.id)
 end



end
