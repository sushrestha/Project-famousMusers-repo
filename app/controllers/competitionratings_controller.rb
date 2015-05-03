class CompetitionratingsController < ApplicationController
  before_action :logged_in_muser
  before_filter :check_for_cancel


  def index
    @competitionratings = CompetitionRating.all
  end

  def new
    @competitionrating = CompetitionRating.new
    @competitionrating.musing = Musing.find(params[:musing_id])
    @currentcompetition = params[:currentcompetition]
  end

  def create
    @competitionrating = CompetitionRating.new(competitionrating_params)
    @competitionrating.musing = Musing.find(params[:competition_rating][:musing_id])
    @competitionrating.competition = Competition.find(params[:competition_rating][:competition_id])
    
    if @competitionrating.save
      #recalculate average competition rating for musing
      #@mymusing = @competitionrating.musing
      #sum = 0.0
      #i = 1.0
      #@mymusing.competitionstars.each do |s| 
      #    (s.competitionstars != nil) ? (star = s.competitionstars) : (star = 0.0)
      #      sum = sum + star
      #      i = i + 1
      #end
      #@mymusing.averageCompetitionRating = (sum == 0.0) ? 0 : (sum/(i-1)).round(1)
      
      #attempt to save the updated average competition rating for the musing
      #if @mymusing.save
        redirect_to :controller => 'competitions', :action => 'show', :id => params[:competition_rating][:competition_id]
        flash[:success] = "competitionrating was successfully created."
      #else
        #if we can't save the new average rating then we have failed
        #and must back out competition rating save
      #  @competitionrating.delete
      #  render 'new', :musing_id => params[:musing_id], :currentcompetition => params[:competition_id]
      #  @mymusing.errors.full_messages.each do |m|
      #    flash[:failure] = m
      #  end
      #end
    else
      render 'new', :musing_id => params[:musing_id], :currentcompetition => params[:competition_id]
      @competitionrating.errors.full_messages.each do |m|
        flash[:failure] = m
      end
    end
  end

  def competitionrating_params
    params.require(:competition_rating).permit(:competitionstars)
  end

    #check_for_cancel
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to competition_show_url(:id => params[:competition_rating][:competition_id])
    end      
  end
end
