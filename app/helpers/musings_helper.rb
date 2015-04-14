module MusingsHelper


def average_ratings(musing)
	@sum = sum_ratings(musing)
    @total = musing.stars.size
    return (@sum == 0.0) ? 0 : (@sum/@total).round(1)
end

def top_musings

end

def popular_musings
end


def sum_ratings(musing)
    @sum = 0
    musing.stars.each do |star|
      @sum = @sum + star.stars.to_i
    end
    return @sum
end


def random_muse
	@musings = Musing.find_by isPrivate: 0

    # @min = 0
    @max = @musings.count
    # @list = Array.new(@max)
    # @musings.id.each do |musing|
    #   @list.push(musing)
    # end
    # @randnum = Random.rand(@min,@max)
    # @id = @list[@randnum]
    # @random_musing = Musing.fing_by(@id)
end



end
