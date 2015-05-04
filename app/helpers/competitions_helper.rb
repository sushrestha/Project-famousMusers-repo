module CompetitionsHelper
  def calculateRating(musing,competitionid)
    sum = 0.0 
    i = 1.0
    musing.competitionstars.where("competition_id=?", competitionid).each do |s|
      puts "competition star: "
      puts s.id
      (s.competitionstars != nil) ? (star = s.competitionstars) : (star = 0.0)
      sum = sum + star
      i = i + 1
    end
    @average = (sum == 0.0) ? 0 : (sum/(i-1)).round(1)
    
    @average
  end
end
