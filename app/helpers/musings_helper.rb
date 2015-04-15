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





end
