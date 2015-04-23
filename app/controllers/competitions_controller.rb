class CompetitionsController < ApplicationController
  #before_action :logged_in_muser, :only => [:new, :create, :edit, :update, :destroy, :show]
  #before_action :correct_muserid,   only: [:edit, :update, :destroy]
  #before_filter :check_for_cancel, :only => [:create, :update]
  #before_filter :find_musing, :only => [:show, :edit, :update,  :destroy]
  #before_action :admin_muser,     only: :destroy
  
  #new
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end
  
  #new
  def new
    @competition = Competition.new
  end
  
  #new
  def create
    @competition  = Competition.new(competition_params)   
     
    if @competition.save
      flash[:success] = "musing was successfully created."
      redirect_to competitions_url()
    else
      @competition.errors.full_messages.each do |m|
        flash[:failure] = m
      end
      render 'new'
    end
  end
  
  #new
  def edit
    @competition = Competition.find(params[:id])
  end

  #new
  def update
    @competition = Competition.find(params[:id])

    if @competition.update(competition_params)
      flash[:success] = "Updated competition successfully."
      redirect_to competition_url(@competition)
    else
     render 'edit'        
    end
  end
  
  #new
  def destroy
    Competition.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to competitions_url
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
  
  def admin_muser
      redirect_to(competitions_url) unless current_user.isModerator
    end
end
