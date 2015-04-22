class CompetitionsController < ApplicationController
  #before_action :logged_in_muser, :only => [:new, :create, :edit, :update, :destroy, :show]
  #before_action :correct_muserid,   only: [:edit, :update, :destroy]
  #before_filter :check_for_cancel, :only => [:create, :update]
  #before_filter :find_musing, :only => [:show, :edit, :update,  :destroy]
  
  def new
  end

  def show
    @competition = Competition.find(params[:id])
  end

  #def update
  #  unless params[:competition][:musing_id].nil? then 
  #    @competition.musings << Musing.find(params[:competition][:musing_id])
  #  end
  #  
  #  if @competition.update(competition_params)
  #    flash[:success] = "Submitted to competition successfully."
  #    redirect_to competition_url(@competition)
  #  else
  #   #root path
  #   #render 'edit'        
  #  end
  #end

  def index
  end
  
  def submit
    @musing = Musing.find(params[:id])
    @competitions = Competition.all
    @submission = Competition.new
  end
  
  def submitPost
    @competition = Competition.find(params[:competition][:competition_id])
    unless params[:musing_id].nil? then 
      @competition.musings << Musing.find(params[:musing_id])
    end
    #competition is already over or not yet begun
    #if (@thecompetition.end < Time.now.to_datetime) or (@thecompetition.start > Time.now.to_datetime) then
    #  render 'submit', :id => params[@musing.id], :competitions => @thecompetition
    #  flash[:failure] = "Competition is not currently in progress."
    #end
    if @competition.update(competition_params)
        redirect_to root_path
        flash[:success] = "Successfully submitted to competition."
    else
      render 'submit', :id => params[@musing.id]
      @competition.errors.full_messages.each do |m|
        flash[:failure] = m
      end
    end
  end
  
  #define params for competitions
  def competition_params
    params.require(:competition).permit(:name, :start, :end, :musing_ids => [])
  end
end
