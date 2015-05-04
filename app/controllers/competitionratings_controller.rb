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
    @musing_id = params[:competition_rating][:musing_id]
    @competition_id = params[:competition_rating][:competition_id]
    @muser_id = current_muser.id
    #CompetitionRating.where("competition_id=3 AND musing_id=1 AND muser_id=1")
    if CompetitionRating.where("competition_id=? AND musing_id=? AND muser_id=?",@competition_id,@musing_id,@muser_id).count > 0
      redirect_to :action => 'new', :currentcompetition => @competition_id, :musing_id => @musing_id
      flash[:warning] = "Already rated"
    else
      @competitionrating = CompetitionRating.new(competitionrating_params)
      @competitionrating.musing = Musing.find(@musing_id)
      @competitionrating.competition = Competition.find(@competition_id)
      @competitionrating.muser = Muser.find(@muser_id)
      if @competitionrating.save
          redirect_to :controller => 'competitions', :action => 'show', :id => params[:competition_rating][:competition_id]
          flash[:success] = "competitionrating was successfully created."
      else
        render 'new', :musing_id => params[:musing_id], :currentcompetition => params[:competition_id]
        @competitionrating.errors.full_messages.each do |m|
          flash[:failure] = m
        end
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
