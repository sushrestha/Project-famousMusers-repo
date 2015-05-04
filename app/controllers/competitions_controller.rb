class CompetitionsController < ApplicationController
  before_action :logged_in_muser
  before_filter :check_for_cancel, :only => [:new, :create, :update]
  before_filter :check_for_cancel_main, :only => [:submit, :submitPost]
  before_action :admin_muser,  :only => [:new, :create, :destroy, :edit, :update]
  
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end
  
  def new
    @competition = Competition.new
  end
  
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
  
  def edit
    @competition = Competition.find(params[:id])
  end

  def update
    @competition = Competition.find(params[:id])

    if @competition.update(competition_params)
      flash[:success] = "Updated competition successfully."
      redirect_to competition_url(@competition)
    else
     render 'edit'        
    end
  end
  
  def destroy
    Competition.find(params[:id]).destroy
    flash[:success] = "Competition deleted"
    redirect_to competitions_url
  end

  def submit
    @musing = Musing.find(params[:id])
    @competitions = Competition.all
    @submission = Competition.new
  end
  
  def submitPost
    @competition = Competition.find(params[:competition][:competition_id])
    #competition is already over or not yet begun
    if (@competition.end < Time.now.to_datetime) or (@competition.start > Time.now.to_datetime) then
      redirect_to :action => 'submit', :id => params[:musing_id]
      flash[:warning] = "Competition is not current in progress"
    else
      #if this musing has already been submitted
      #Competition.first.musings.where(id=3).count > 0
      if @competition.musings.where("musing_id=?",params[:musing_id]).count > 0
        redirect_to :action => 'submit', :id => params[:musing_id]
        flash[:warning] = "Musing already submitted to competition"
      else
        unless params[:musing_id].nil? then 
          @competition.musings << Musing.find(params[:musing_id])
        end
        if @competition.update(competition_params)
            redirect_to root_path
            flash[:success] = "Successfully submitted to competition."
        else
          redirect_to :action => 'submit', :id => params[:musing_id]
          @competition.errors.full_messages.each do |m|
            flash[:failure] = m
          end
        end
      end
    end
  end
  
  #define params for competitions
  def competition_params
    params.require(:competition).permit(:name, :start, :end, :musing_ids => [])
  end
  
  def admin_muser
      unless current_muser.isModerator then
        redirect_to(competitions_url)
        flash[:warning] = "You are not a moderator"
      end
  end
  
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to competitions_url
    end      
  end
  
  def check_for_cancel_main
    if params[:commit] == "Cancel"
      redirect_to root_url
    end      
  end
end
